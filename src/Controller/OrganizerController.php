<?php

namespace App\Controller;

use App\Repository\EventRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Security\Csrf\CsrfTokenManagerInterface;
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
    public function index(EventRepository $eventRepository): Response
    {
        $user = $this->getUser();
        // Récupérer mes événements triés par date
        $myEvents = $eventRepository->findBy(['organizer' => $user], ['startAt' => 'ASC']);

        $nextEvent = null;
        $now = new \DateTime();

        $upcomingActivities = [];
        $uniqueParticipants = []; // Pour la liste des intervenants

        $totalEvents = count($myEvents);
        $totalParticipants = 0;
        $totalActivities = 0;

        foreach ($myEvents as $event) {
            // Calcul du prochain événement global
            if (!$nextEvent && $event->getStartAt() > $now) {
                $nextEvent = $event;
            }

            // Calcul des activités et participants
            foreach ($event->getActivities() as $activity) {
                $totalActivities++;
                $totalParticipants += count($activity->getParticipants());

                // Si l'activité est dans le futur, on l'ajoute à la liste "À venir"
                if ($activity->getStartAt() > $now) {
                    $upcomingActivities[] = $activity;
                }

                // Récupération des participants uniques (simulés comme intervenants)
                foreach ($activity->getParticipants() as $participant) {
                    $uniqueParticipants[$participant->getId()] = $participant;
                }
            }
        }

        // Trier les activités à venir par date la plus proche
        usort($upcomingActivities, fn($a, $b) => $a->getStartAt() <=> $b->getStartAt());

        return $this->render('organizer/index.html.twig', [
            'events' => $myEvents,
            'nextEvent' => $nextEvent,
            'upcomingActivities' => array_slice($upcomingActivities, 0, 5), // Les 5 prochaines
            'intervenants' => array_slice($uniqueParticipants, 0, 6), // Les 6 premiers
            'stats' => [
                'totalEvents' => $totalEvents,
                'totalActivities' => $totalActivities,
                'totalParticipants' => $totalParticipants,
                'intervenants' => count($uniqueParticipants)
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
        if ($event->getOrganizer() !== $this->getUser()) {
            throw $this->createAccessDeniedException();
        }

        $activity = new TournamentActivity();
        $activity->setEvent($event);

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

    #[Route('/my-events', name: 'app_organizer_event_list')]
    public function list(EventRepository $eventRepository): Response
    {
        $user = $this->getUser();
        $events = $eventRepository->findBy(['organizer' => $user], ['startAt' => 'DESC']);

        return $this->render('organizer/event_list.html.twig', [
            'events' => $events,
        ]);
    }

    #[Route('/event/{id}/edit', name: 'app_organizer_event_edit')]
    public function edit(Request $request, Event $event, EntityManagerInterface $entityManager): Response
    {
        // Sécurité : Vérifier que c'est bien MON événement
        if ($event->getOrganizer() !== $this->getUser()) {
            throw $this->createAccessDeniedException();
        }

        $form = $this->createForm(EventType::class, $event);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();
            $this->addFlash('success', 'Événement modifié avec succès !');
            return $this->redirectToRoute('app_organizer_event_list');
        }

        return $this->render('organizer/edit.html.twig', [
            'event' => $event,
            'form' => $form,
        ]);
    }

    #[Route('/event/{id}/delete', name: 'app_organizer_event_delete', methods: ['POST'])]
    public function delete(Request $request, Event $event, EntityManagerInterface $entityManager): Response
    {
        if ($event->getOrganizer() !== $this->getUser()) {
            throw $this->createAccessDeniedException();
        }

        if ($this->isCsrfTokenValid('delete'.$event->getId(), $request->request->get('_token'))) {
            $entityManager->remove($event);
            $entityManager->flush();
            $this->addFlash('success', 'Événement supprimé.');
        }

        return $this->redirectToRoute('app_organizer_event_list');
    }
}