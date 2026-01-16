<?php

namespace App\Controller;

use App\Repository\EventRepository;
use App\Repository\RegistrationRepository;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\Form\UserType;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
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
        
        // Si l'utilisateur est Organisateur, on prépare les stats de son dashboard
        if ($this->isGranted('ROLE_ORGANIZER')) {
            $myCreatedEvents = $eventRepository->findBy(['organizer' => $user], ['startAt' => 'ASC']);
            
            $nextEvent = null;
            $now = new \DateTime();
            $upcomingActivities = [];
            
            // 👇 CORRECTION ICI : On stocke des objets Intervenant
            $uniqueIntervenants = []; 
            
            $totalParticipants = 0;
            $totalActivities = 0;

            foreach ($myCreatedEvents as $event) {
                if (!$nextEvent && $event->getStartAt() > $now) {
                    $nextEvent = $event;
                }

                // 1. Récupération des VRAIS Intervenants (comme dans OrganizerController)
                foreach ($event->getIntervenants() as $intervenant) {
                    $uniqueIntervenants[$intervenant->getId()] = $intervenant;
                }

                $totalParticipants += count($event->getRegistrations());

                foreach ($event->getActivities() as $activity) {
                    $totalActivities++;
                    // On compte aussi les participants aux activités pour les stats
                    $totalParticipants += count($activity->getParticipants());
                    
                    if ($activity->getStartAt() > $now) {
                        $upcomingActivities[] = $activity;
                    }
                }
            }
            
            usort($upcomingActivities, fn($a, $b) => $a->getStartAt() <=> $b->getStartAt());

            $organizerData = [
                'createdEvents' => $myCreatedEvents,
                'nextEvent' => $nextEvent,
                'upcomingActivities' => array_slice($upcomingActivities, 0, 5),
                // On passe bien les objets Intervenant à la vue
                'intervenants' => array_slice($uniqueIntervenants, 0, 6), 
                'stats' => [
                    'totalEvents' => count($myCreatedEvents),
                    'totalActivities' => $totalActivities,
                    'totalParticipants' => $totalParticipants,
                    'intervenants' => count($uniqueIntervenants)
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
    public function edit(
        Request $request, 
        EntityManagerInterface $entityManager, 
        UserPasswordHasherInterface $userPasswordHasher
    ): Response
    {   
        /** @var \App\Entity\User $user */
        $user = $this->getUser();
        
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            
            $plainPassword = $form->get('plainPassword')->getData();
            if ($plainPassword) {
                $user->setPassword(
                    $userPasswordHasher->hashPassword(
                        $user,
                        $plainPassword
                    )
                );
            }

            $entityManager->flush();
            
            $this->addFlash('success', 'Informations mises à jour avec succès !');
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