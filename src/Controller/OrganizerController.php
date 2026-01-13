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

#[Route('/organizer')]
#[IsGranted('ROLE_ORGANIZER')]
class OrganizerController extends AbstractController
{
    #[Route('/dashboard', name: 'app_organizer_dashboard')]
    #[Route('/dashboard', name: 'app_organizer_dashboard')]
    public function index(EventRepository $eventRepository): Response
    {
        $user = $this->getUser();
        $myEvents = $eventRepository->findBy(['organizer' => $user], ['startAt' => 'ASC']);

        $nextEvent = null;
        $now = new \DateTime();

        $totalEvents = count($myEvents);
        
        $totalParticipants = 0;
        $totalActivities = 0;

        foreach ($myEvents as $event) {
            $totalActivities += count($event->getActivities());

            foreach ($myEvents as $event) {
            if ($event->getStartAt() > $now) {
                $nextEvent = $event;
                break;
            }
        }
        }

        return $this->render('organizer/index.html.twig', [
            'events' => $myEvents,
            'nextEvent' => $nextEvent,
            'stats' => [
                'totalEvents' => $totalEvents,
                'totalActivities' => $totalActivities,
                'totalParticipants' => $totalParticipants,
                'intervenants' => 0 
            ]
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

        return $this->render('organizer/new.html.twig', [
            'form' => $form,
        ]);
    }

    #[Route('/event/{id}/add-tournament', name: 'app_organizer_add_tournament')]
    public function addTournament(Event $event, Request $request, EntityManagerInterface $entityManager): Response
    {
        // Vérifie que c'est bien MON événement
        if ($event->getOrganizer() !== $this->getUser()) {
            throw $this->createAccessDeniedException();
        }

        $activity = new TournamentActivity();
        $activity->setEvent($event); // On lie l'activité à l'événement

        $form = $this->createForm(TournamentType::class, $activity);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($activity);
            $entityManager->flush();
            $this->addFlash('success', 'Tournoi ajouté avec succès !');
            return $this->redirectToRoute('app_event_show', ['id' => $event->getId()]);
        }

        return $this->render('organizer/add_activity.html.twig', [
            'form' => $form,
            'event' => $event,
            'type' => 'Tournoi'
        ]);
    }

    #[Route('/event/{id}/add-boardgame', name: 'app_organizer_add_boardgame')]
    public function addBoardGame(Event $event, Request $request, EntityManagerInterface $entityManager): Response
    {
        if ($event->getOrganizer() !== $this->getUser()) {
            throw $this->createAccessDeniedException();
        }

        $activity = new BoardGameActivity();
        $activity->setEvent($event);

        $form = $this->createForm(BoardGameType::class, $activity);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($activity);
            $entityManager->flush();
            $this->addFlash('success', 'Jeu de plateau ajouté avec succès !');
            return $this->redirectToRoute('app_event_show', ['id' => $event->getId()]);
        }

        return $this->render('organizer/add_activity.html.twig', [
            'form' => $form,
            'event' => $event,
            'type' => 'Jeu de Plateau'
        ]);
    }

    
}