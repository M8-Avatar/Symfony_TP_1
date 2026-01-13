<?php

namespace App\Controller;

use App\Repository\EventRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use App\Form\ProfileType;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;

#[Route('/user')]
#[IsGranted('ROLE_USER')]
class UserController extends AbstractController
{
    #[Route('/me', name: 'app_user_profile')]
    public function index(EventRepository $eventRepository): Response
    {
        /** @var \App\Entity\User $user */
        $user = $this->getUser();

        // 1. Données pour TOUT LE MONDE (Participations)
        $myParticipations = $user->getEventsParticipating();

        // 2. Données pour les ORGANISATEURS seulement
        $organizerData = [];
        
        if ($this->isGranted('ROLE_ORGANIZER')) {
            $myCreatedEvents = $eventRepository->findBy(['organizer' => $user], ['startAt' => 'ASC']);
            
            // Calculs des stats (copié de ton ancien controller)
            $nextEvent = null;
            $now = new \DateTime();
            $upcomingActivities = [];
            $uniqueParticipants = [];
            $totalParticipants = 0;
            $totalActivities = 0;

            foreach ($myCreatedEvents as $event) {
                if (!$nextEvent && $event->getStartAt() > $now) {
                    $nextEvent = $event;
                }

                foreach ($event->getActivities() as $activity) {
                    $totalActivities++;
                    $totalParticipants += count($activity->getParticipants());

                    if ($activity->getStartAt() > $now) {
                        $upcomingActivities[] = $activity;
                    }
                    foreach ($activity->getParticipants() as $participant) {
                        $uniqueParticipants[$participant->getId()] = $participant;
                    }
                }
            }
            
            usort($upcomingActivities, fn($a, $b) => $a->getStartAt() <=> $b->getStartAt());

            $organizerData = [
                'createdEvents' => $myCreatedEvents,
                'nextEvent' => $nextEvent,
                'upcomingActivities' => array_slice($upcomingActivities, 0, 5),
                'intervenants' => array_slice($uniqueParticipants, 0, 6),
                'stats' => [
                    'totalEvents' => count($myCreatedEvents),
                    'totalActivities' => $totalActivities,
                    'totalParticipants' => $totalParticipants,
                    'intervenants' => count($uniqueParticipants)
                ]
            ];
        }

        return $this->render('user/index.html.twig', [
            'user' => $user,
            'participations' => $myParticipations,
            'organizerData' => $organizerData, // Sera vide si pas admin
        ]);
    }

    #[Route('/me/edit', name: 'app_user_edit')]
    public function edit(Request $request, EntityManagerInterface $entityManager): Response
    {   
        /** @var \App\Entity\User $user */
        $user = $this->getUser();
        $profile = $user->getProfile();

        $form = $this->createForm(ProfileType::class, $profile);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();
            
            $this->addFlash('success', 'Profil mis à jour avec succès !');
            return $this->redirectToRoute('app_user_profile');
        }

        return $this->render('user/edit.html.twig', [
            'form' => $form,
        ]);
    }
}