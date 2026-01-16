<?php

namespace App\Controller;

use App\Repository\EventRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\HttpFoundation\Request;

class HomeController extends AbstractController
{
    #[Route('/', name: 'app_home')]
    public function index(EventRepository $eventRepository, Request $request): Response
    {
        $query = $request->query->get('q');
        $category = $request->query->get('category');

        if ($query || $category) {
            $events = $eventRepository->findBySearch($query, $category);
        } else {
            $events = $eventRepository->createQueryBuilder('e')
                ->where('e.startAt > :now')
                ->setParameter('now', new \DateTime())
                ->orderBy('e.startAt', 'ASC')
                ->getQuery()
                ->getResult();
        }

        return $this->render('home/index.html.twig', [
            'events' => $events,
            'currentSearch' => $query,
            'currentCategory' => $category
        ]);
    }
}