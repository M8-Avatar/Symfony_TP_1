<?php

namespace App\Controller;

use App\Repository\EventRepository;
use App\Repository\RegistrationRepository;
use App\Repository\UserRepository;
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

        $myRegistrations = $user->getRegistrations();

        $organizerData = [];
        
        if ($this->isGranted('ROLE_ORGANIZER')) {
            $myCreatedEvents = $eventRepository->findBy(['organizer' => $user], ['startAt' => 'ASC']);
            
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

                $totalParticipants += count($event->getRegistrations());

                foreach ($event->getActivities() as $activity) {
                    $totalActivities++;
                    
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
            'participations' => $myRegistrations,
            'organizerData' => $organizerData,
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

    #[Route('/my-participants', name: 'app_organizer_participant_list')]
    public function listParticipants(RegistrationRepository $registrationRepo): Response
    {
        $user = $this->getUser();
        
        $registrations = $registrationRepo->createQueryBuilder('r')
            ->join('r.event', 'e')
            ->where('e.organizer = :organizer')
            ->setParameter('organizer', $user)
            ->orderBy('r.registeredAt', 'DESC')
            ->getQuery()
            ->getResult();

        return $this->render('organizer/participant_list.html.twig', [
            'registrations' => $registrations,
        ]);
    }

    #[Route('/event/{eventId}/remove-participant/{userId}', name: 'app_organizer_participant_delete', methods: ['POST'])]
    public function removeParticipant(
        int $eventId, 
        int $userId, 
        EventRepository $eventRepository, 
        UserRepository $userRepository,
        RegistrationRepository $registrationRepo,
        EntityManagerInterface $entityManager,
        Request $request
    ): Response
    {
        $event = $eventRepository->find($eventId);
        $participant = $userRepository->find($userId);

        if ($event->getOrganizer() !== $this->getUser()) {
            throw $this->createAccessDeniedException();
        }

        if ($this->isCsrfTokenValid('delete_participant'.$event->getId().$participant->getId(), $request->request->get('_token'))) {
            
            $registration = $registrationRepo->findOneBy(['event' => $event, 'user' => $participant]);

            if ($registration) {
                $entityManager->remove($registration);

                foreach ($event->getActivities() as $activity) {
                    if ($activity->getParticipants()->contains($participant)) {
                        $activity->removeParticipant($participant);
                    }
                }

                $entityManager->flush();
                $this->addFlash('success', 'Participant désinscrit avec succès.');
            }
        }

        return $this->redirectToRoute('app_organizer_participant_list');
    }
}