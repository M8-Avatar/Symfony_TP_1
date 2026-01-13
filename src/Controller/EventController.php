<?php

namespace App\Controller;

use App\Entity\Event;
use App\Entity\Activity;
use App\Entity\Registration;
use App\Repository\RegistrationRepository;
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
    public function register(
        Event $event, 
        EntityManagerInterface $entityManager,
        RegistrationRepository $registrationRepo
    ): Response
    {
        /** @var \App\Entity\User $user */
        $user = $this->getUser();

        $existingRegistration = $registrationRepo->findOneBy([
            'event' => $event,
            'user' => $user
        ]);

        if ($existingRegistration) {
            $entityManager->remove($existingRegistration);
            
            foreach ($event->getActivities() as $activity) {
                if ($activity->getParticipants()->contains($user)) {
                    $activity->removeParticipant($user);
                }
            }
            
            $this->addFlash('warning', 'Désinscription effectuée.');
        } else {

            if ($event->getRegistrations()->count() >= $event->getCapacity()) {
                $this->addFlash('danger', 'Désolé, cet événement est complet !');
                return $this->redirectToRoute('app_event_show', ['id' => $event->getId()]);
            }
            $registration = new Registration();
            $registration->setEvent($event);
            $registration->setUser($user);
            $registration->setRegisteredAt(new \DateTimeImmutable());

            $entityManager->persist($registration);
            $this->addFlash('success', 'Bravo ! Votre place est réservée.');
        }

        $entityManager->flush();

        return $this->redirectToRoute('app_event_show', ['id' => $event->getId()]);
    }

    #[Route('/activity/{id}/join', name: 'app_activity_join')]
    #[IsGranted('ROLE_USER')]
    public function join(Activity $activity, EntityManagerInterface $entityManager, RegistrationRepository $registrationRepo): Response
    {
        /** @var \App\Entity\User $user */
        $user = $this->getUser();
        $event = $activity->getEvent();

        $isRegisteredToEvent = $registrationRepo->findOneBy(['event' => $event, 'user' => $user]);

        if (!$isRegisteredToEvent) {
            $this->addFlash('danger', 'Vous devez d\'abord réserver votre place pour l\'événement global.');
            return $this->redirectToRoute('app_event_show', ['id' => $event->getId()]);
        }

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