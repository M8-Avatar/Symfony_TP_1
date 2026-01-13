<?php

namespace App\Controller;

use App\Entity\Event;
use App\Entity\Activity;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Security\Http\Attribute\IsGranted;

class EventController extends AbstractController
{
    #[Route('/event/{id}', name: 'app_event_show')]
    public function show(Event $event): Response
    {   
        return $this->render('event/show.html.twig', [
            'event' => $event,
        ]);
    }

    #[Route('/event/{id}/register', name: 'app_event_register')]
    #[IsGranted('ROLE_USER')]
    public function register(Event $event, EntityManagerInterface $entityManager): Response
    {
        /** @var \App\Entity\User $user */
        $user = $this->getUser();

        if ($event->getParticipants()->contains($user)) {
            $event->removeParticipant($user);
            
            foreach ($event->getActivities() as $activity) {
                if ($activity->getParticipants()->contains($user)) {
                    $activity->removeParticipant($user);
                }
            }
            
            $this->addFlash('warning', 'Désinscription effectuée (y compris de vos activités).');
        } else {
            if ($event->getParticipants()->count() >= $event->getCapacity()) {
                $this->addFlash('danger', 'Désolé, cet événement est complet !');
                return $this->redirectToRoute('app_event_show', ['id' => $event->getId()]);
            }

            $event->addParticipant($user);
            $this->addFlash('success', 'Bravo ! Votre place est réservée.');
        }

        $entityManager->flush();

        return $this->redirectToRoute('app_event_show', ['id' => $event->getId()]);
    }

    #[Route('/activity/{id}/join', name: 'app_activity_join')]
    #[IsGranted('ROLE_USER')]
    public function join(Activity $activity, EntityManagerInterface $entityManager): Response
    {
        /** @var \App\Entity\User $user */
        $user = $this->getUser();
        $event = $activity->getEvent();

        // 🔒 SÉCURITÉ : On ne peut pas rejoindre une activité si on n'est pas dans l'événement !
        if (!$event->getParticipants()->contains($user)) {
            $this->addFlash('danger', 'Vous devez d\'abord réserver votre place pour l\'événement global avant de rejoindre une activité.');
            return $this->redirectToRoute('app_event_show', ['id' => $event->getId()]);
        }

        // Logique Toggle (Rejoindre / Quitter)
        if ($activity->getParticipants()->contains($user)) {
            $activity->removeParticipant($user);
            $this->addFlash('warning', 'Vous êtes désinscrit de l\'activité.');
        } else {
            $activity->addParticipant($user);
            $this->addFlash('success', 'Inscription à l\'activité validée !');
        }

        $entityManager->flush();

        return $this->redirectToRoute('app_event_show', ['id' => $event->getId()]);
    }
}