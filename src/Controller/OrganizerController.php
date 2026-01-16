<?php

namespace App\Controller;

use App\Repository\EventRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use App\Entity\Event;
use App\Form\EventType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use App\Entity\TournamentActivity;
use App\Entity\BoardGameActivity;
use App\Form\TournamentType;
use App\Form\BoardGameType;
use App\Repository\ActivityRepository;

#[Route('/organizer')]
#[IsGranted('ROLE_ORGANIZER')]
class OrganizerController extends AbstractController
{
    #[Route('/dashboard', name: 'app_organizer_dashboard')]
    public function index(EventRepository $eventRepository): Response
    {
        /** @var \App\Entity\User $user */
        $user = $this->getUser();

        // Récupérer mes événements triés par date
        $myEvents = $eventRepository->findBy(['organizer' => $user], ['startAt' => 'ASC']);

        $nextEvent = null;
        $now = new \DateTime();

        $upcomingActivities = [];
        $uniqueIntervenants = []; // On stocke les Entités Intervenant

        $totalEvents = count($myEvents);
        $totalParticipants = 0;
        $totalActivities = 0;

        foreach ($myEvents as $event) {
            // 1. Calcul du prochain événement global
            if (!$nextEvent && $event->getStartAt() > $now) {
                $nextEvent = $event;
            }

            // 2. Récupération des VRAIS Intervenants (VIP)
            foreach ($event->getIntervenants() as $intervenant) {
                $uniqueIntervenants[$intervenant->getId()] = $intervenant;
            }

            // 3. Calcul des activités et participants
            foreach ($event->getActivities() as $activity) {
                $totalActivities++;
                $totalParticipants += count($activity->getParticipants());

                if ($activity->getStartAt() > $now) {
                    $upcomingActivities[] = $activity;
                }
            }
            
            // Ajout des inscrits globaux à l'event
            $totalParticipants += count($event->getRegistrations());
        }

        // Trier les activités à venir par date la plus proche
        usort($upcomingActivities, fn($a, $b) => $a->getStartAt() <=> $b->getStartAt());

        return $this->render('user/index.html.twig', [
            'organizerData' => [
                'createdEvents' => $myEvents,
                'nextEvent' => $nextEvent,
                'upcomingActivities' => array_slice($upcomingActivities, 0, 5),
                'intervenants' => array_slice(array_values($uniqueIntervenants), 0, 6), 
                'stats' => [
                    'totalEvents' => $totalEvents,
                    'totalActivities' => $totalActivities,
                    'totalParticipants' => $totalParticipants,
                    'intervenants' => count($uniqueIntervenants)
                ]
            ],
            'participations' => $user->getRegistrations() 
        ]);
    }
    
    #[Route('/event/new', name: 'app_organizer_event_new')]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $event = new Event();
        $form = $this->createForm(EventType::class, $event);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $event->setOrganizer($this->getUser());
            $entityManager->persist($event);
            $entityManager->flush();
            $this->addFlash('success', 'Événement créé avec succès !');
            return $this->redirectToRoute('app_organizer_dashboard');
        }
        return $this->render('organizer/new.html.twig', ['form' => $form]);
    }

    #[Route('/event/{id}/add-tournament', name: 'app_organizer_add_tournament')]
    public function addTournament(Event $event, Request $request, EntityManagerInterface $entityManager): Response
    {
        if ($event->getOrganizer() !== $this->getUser()) { throw $this->createAccessDeniedException(); }
        
        $activity = new TournamentActivity();
        $activity->setEvent($event);
        $form = $this->createForm(TournamentType::class, $activity);
        $form->handleRequest($request);
        
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($activity);
            $entityManager->flush();
            $this->addFlash('success', 'Tournoi ajouté !');
            
            // 👇 CORRECTION : Retour à la section programme
            return $this->redirectToRoute('app_event_show', [
                'id' => $event->getId(),
                '_fragment' => 'programme'
            ]);
        }
        return $this->render('organizer/add_activity.html.twig', ['form' => $form, 'event' => $event, 'type' => 'Tournoi']);
    }

    #[Route('/event/{id}/add-boardgame', name: 'app_organizer_add_boardgame')]
    public function addBoardGame(Event $event, Request $request, EntityManagerInterface $entityManager): Response
    {
        if ($event->getOrganizer() !== $this->getUser()) { throw $this->createAccessDeniedException(); }
        
        $activity = new BoardGameActivity();
        $activity->setEvent($event);
        $form = $this->createForm(BoardGameType::class, $activity);
        $form->handleRequest($request);
        
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($activity);
            $entityManager->flush();
            $this->addFlash('success', 'Jeu ajouté !');
            
            // 👇 CORRECTION : Retour à la section programme
            return $this->redirectToRoute('app_event_show', [
                'id' => $event->getId(),
                '_fragment' => 'programme'
            ]);
        }
        return $this->render('organizer/add_activity.html.twig', ['form' => $form, 'event' => $event, 'type' => 'Jeu de Plateau']);
    }

    #[Route('/my-events', name: 'app_organizer_event_list')]
    public function list(EventRepository $eventRepository): Response
    {
        $user = $this->getUser();
        $events = $eventRepository->findBy(['organizer' => $user], ['startAt' => 'DESC']);
        return $this->render('organizer/event_list.html.twig', ['events' => $events]);
    }

    #[Route('/event/{id}/edit', name: 'app_organizer_event_edit')]
    public function edit(Request $request, Event $event, EntityManagerInterface $entityManager): Response
    {
        if ($event->getOrganizer() !== $this->getUser()) { throw $this->createAccessDeniedException(); }
        $form = $this->createForm(EventType::class, $event);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();
            $this->addFlash('success', 'Événement modifié !');
            return $this->redirectToRoute('app_organizer_event_list');
        }
        return $this->render('organizer/edit.html.twig', ['event' => $event, 'form' => $form]);
    }

    #[Route('/event/{id}/delete', name: 'app_organizer_event_delete', methods: ['POST'])]
    public function delete(Request $request, Event $event, EntityManagerInterface $entityManager): Response
    {
        if ($event->getOrganizer() !== $this->getUser()) { throw $this->createAccessDeniedException(); }
        if ($this->isCsrfTokenValid('delete'.$event->getId(), $request->request->get('_token'))) {
            $entityManager->remove($event);
            $entityManager->flush();
            $this->addFlash('success', 'Événement supprimé.');
        }
        return $this->redirectToRoute('app_organizer_event_list');
    }

    #[Route('/my-activities', name: 'app_organizer_activity_list')]
    public function listActivities(ActivityRepository $activityRepository): Response
    {
        $user = $this->getUser();
        $activities = $activityRepository->createQueryBuilder('a')
            ->join('a.event', 'e')
            ->where('e.organizer = :user')
            ->setParameter('user', $user)
            ->orderBy('a.startAt', 'DESC')
            ->getQuery()->getResult();
        return $this->render('organizer/activity_list.html.twig', ['activities' => $activities]);
    }
}