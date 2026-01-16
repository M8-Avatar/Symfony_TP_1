<?php

namespace App\Controller\Admin;

use App\Entity\Event;
use App\Entity\User;
use App\Entity\Intervenant;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[IsGranted('ROLE_ORGANIZER')] // Changed from ROLE_ADMIN
class DashboardController extends AbstractDashboardController
{
    #[Route('/admin', name: 'admin')]
    public function index(): Response
    {
        return $this->render('admin/dashboard.html.twig');
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('GeekEvents Admin')
            ->renderContentMaximized();
    }

    public function configureMenuItems(): iterable
    {
        yield MenuItem::linkToDashboard('Dashboard', 'fa fa-home');
        
        // Section Utilisateurs
        yield MenuItem::section('Utilisateurs');
        yield MenuItem::linkToCrud('Membres', 'fas fa-users', User::class);

        // Section Événements
        yield MenuItem::section('Événements');
        yield MenuItem::linkToCrud('Événements', 'fas fa-calendar-alt', Event::class);

        // Section Intervenants
        yield MenuItem::section('Intervenants');
        yield MenuItem::linkToCrud('Intervenants', 'fas fa-microphone', Intervenant::class);
        
        // Retour au site
        yield MenuItem::section('Navigation');
        yield MenuItem::linkToRoute('Retour au site', 'fa fa-arrow-left', 'app_home');
    }
}