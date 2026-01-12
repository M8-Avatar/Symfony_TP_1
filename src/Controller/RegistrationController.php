<?php

namespace App\Controller;

use App\Entity\User;
use App\Entity\Profile;
use App\Form\RegistrationFormType;
use App\Security\AppAuthenticator;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Bundle\SecurityBundle\Security;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Attribute\Route;

class RegistrationController extends AbstractController
{
    #[Route('/register', name: 'app_register')]
    public function register(Request $request, UserPasswordHasherInterface $userPasswordHasher, Security $security, EntityManagerInterface $entityManager): Response
{
    $user = new User();
    $form = $this->createForm(RegistrationFormType::class, $user);
    $form->handleRequest($request);

    if ($form->isSubmitted() && $form->isValid()) {
        /** @var string $plainPassword */
        $plainPassword = $form->get('plainPassword')->getData();

        // encode the plain password
        $user->setPassword($userPasswordHasher->hashPassword($user, $plainPassword));
        
        // --- AJOUT GEEKEVENTS : Création automatique du Profil ---
        $profile = new Profile();
        // On génère un pseudo par défaut basé sur le début de l'email
        $pseudo = explode('@', $user->getEmail())[0];
        $profile->setPseudo($pseudo);
        
        $user->setProfile($profile);
        $profile->setUser($user);
        
        $entityManager->persist($profile);
        // ---------------------------------------------------------

        $entityManager->persist($user);
        $entityManager->flush();

        // do anything else you need here, like send an email

        return $security->login($user, AppAuthenticator::class, 'main');
    }

    return $this->render('registration/register.html.twig', [
        'registrationForm' => $form,
    ]);
}

    
}
