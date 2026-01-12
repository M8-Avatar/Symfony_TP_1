<?php

namespace App\Controller;

use App\Entity\Event;
use App\Entity\Activity;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Doctrine\ORM\EntityManagerInterface;

class EventController extends AbstractController
{
    #[Route('/event/{id}', name: 'app_event_show')]
    public function show(Event $event): Response
    {   
        return $this->render('event/show.html.twig', [
            'event' => $event,
        ]);
    }

    #[Route('/activity/{id}/join', name: 'app_activity_join')]
    public function join(Activity $activity, EntityManagerInterface $entityManager): Response
    {
        /** @var \App\Entity\User $user */
        $user = $this->getUser();

        // Sécurité : Il faut être connecté
        if (!$user) {
            return $this->redirectToRoute('app_login');
        }

        // Logique : Si déjà participant => on enlève. Sinon => on ajoute.
        if ($activity->getParticipants()->contains($user)) {
            $activity->removeParticipant($user);
            $this->addFlash('success', 'Vous êtes désinscrit de l\'activité.');
        } else {
            $activity->addParticipant($user);
            $this->addFlash('success', 'Inscription validée !');
        }

        $entityManager->flush();

        // On redirige vers la page de l'événement parent
        return $this->redirectToRoute('app_event_show', ['id' => $activity->getEvent()->getId()]);
    }

    #[Route('/event/{id}/register', name: 'app_event_register')]
    public function register(Event $event, EntityManagerInterface $entityManager): Response
    {
        $user = $this->getUser();

        if (!$user) {
            return $this->redirectToRoute('app_login');
        }

        if ($event->getParticipants()->contains($user)) {
            $event->removeParticipant($user);
            $this->addFlash('success', 'Désinscription de l\'événement effectuée.');
        } else {
            $event->addParticipant($user);
            $this->addFlash('success', 'Vous participez à l\'événement !');
        }

        $entityManager->flush();

        return $this->redirectToRoute('app_event_show', ['id' => $event->getId()]);
    }
}