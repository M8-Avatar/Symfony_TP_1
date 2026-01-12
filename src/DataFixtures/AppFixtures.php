<?php

namespace App\DataFixtures;

use App\Entity\BoardGameActivity;
use App\Entity\Event;
use App\Entity\Profile;
use App\Entity\TournamentActivity;
use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class AppFixtures extends Fixture
{
    private UserPasswordHasherInterface $hasher;

    public function __construct(UserPasswordHasherInterface $hasher)
    {
        $this->hasher = $hasher;
    }

    public function load(ObjectManager $manager): void
    {
        // Utilisation de Faker en français
        $faker = Factory::create('fr_FR');

        // Tableaux pour stocker les objets et faire des relations
        $users = [];
        $events = [];

        // 1️⃣ CRÉATION DE L'ADMIN (ORGANISATEUR)
        $admin = new User();
        $admin->setEmail('admin@geekevents.com');
        $admin->setPassword($this->hasher->hashPassword($admin, 'password'));
        $admin->setRoles(['ROLE_ORGANIZER']);
        
        // Note: Si tu n'as pas de setCreatedAt, il faudra peut-être l'ajouter dans l'entité User, 
        // ou le gérer dans le constructeur de l'entité. 
        // Par défaut make:entity le génère souvent.
        if (method_exists($admin, 'setCreatedAt')) {
            $admin->setCreatedAt(new \DateTimeImmutable());
        }

        // Profil de l'admin
        $adminProfile = new Profile();
        $adminProfile->setPseudo('AdminGeek');
        $adminProfile->setBio('Administrateur suprême de GeekEvents.');
        $adminProfile->setFavoriteUniverse('Matrix');
        $adminProfile->setAvatarUrl('https://api.dicebear.com/7.x/avataaars/svg?seed=Admin');
        
        // Liaison
        $admin->setProfile($adminProfile);
        $adminProfile->setUser($admin);

        $manager->persist($admin);
        $manager->persist($adminProfile);
        $users[] = $admin;

        // 2️⃣ CRÉATION DE 20 UTILISATEURS (PARTICIPANTS)
        for ($i = 0; $i < 20; $i++) {
            $user = new User();
            $user->setEmail($faker->unique()->email());
            $user->setPassword($this->hasher->hashPassword($user, 'password'));
            $user->setRoles(['ROLE_USER']);
            
            if (method_exists($user, 'setCreatedAt')) {
                $user->setCreatedAt(\DateTimeImmutable::createFromMutable($faker->dateTimeBetween('-1 year', 'now')));
            }

            $profile = new Profile();
            $profile->setPseudo($faker->userName());
            $profile->setBio($faker->sentence(10));
            $profile->setFavoriteUniverse($faker->randomElement(['Star Wars', 'Marvel', 'Manga', 'Warhammer', 'Nintendo']));
            $profile->setAvatarUrl('https://api.dicebear.com/7.x/avataaars/svg?seed=' . $user->getEmail());

            $user->setProfile($profile);
            $profile->setUser($user);

            $manager->persist($user);
            $manager->persist($profile);
            $users[] = $user;
        }

        // 3️⃣ CRÉATION DE 10 ÉVÉNEMENTS
        $eventCategories = ['Convention', 'Tournoi E-sport', 'Soirée Jeux', 'Conférence'];
        $locations = ['Paris Expo', 'Eurexpo Lyon', 'Accor Arena', 'Salle des fêtes de Trifouilly'];

        for ($j = 0; $j < 10; $j++) {
            $event = new Event();
            $event->setTitle($faker->sentence(3, true));
            $event->setDescription($faker->paragraph(3));
            
            $startDate = $faker->dateTimeBetween('now', '+1 year');
            $event->setStartAt($startDate);
            // Clone pour ne pas modifier la date de début
            $endDate = (clone $startDate)->modify('+' . rand(1, 3) . ' days');
            $event->setEndAt($endDate);
            
            $event->setCapacity($faker->numberBetween(50, 5000));
            $event->setCategory($faker->randomElement($eventCategories)); // Assure-toi d'avoir ce champ dans Event
            $event->setLocation($faker->randomElement($locations));       // Assure-toi d'avoir ce champ dans Event
            
            $event->setOrganizer($faker->randomElement($users));

            $manager->persist($event);
            $events[] = $event;

            // 4️⃣ CRÉATION DES ACTIVITÉS
            $nbActivities = rand(2, 5);
            
            for ($k = 0; $k < $nbActivities; $k++) {
                if ($faker->boolean(50)) {
                    // TOURNAMENT
                    $activity = new TournamentActivity();
                    $activity->setGame($faker->randomElement(['League of Legends', 'CS:GO', 'Valorant', 'Smash Bros']));
                    $activity->setPlatform($faker->randomElement(['PC', 'PS5', 'Switch']));
                    $activity->setFormat($faker->randomElement(['1v1', '5v5', 'Battle Royale']));
                    $activity->setRules("Fair-play obligatoire.");
                } else {
                    // BOARD GAME
                    $activity = new BoardGameActivity();
                    $activity->setGameName($faker->randomElement(['Catan', 'Dixit', '7 Wonders', 'Dungeons & Dragons']));
                    $activity->setMinPlayers(2);
                    $activity->setMaxPlayers($faker->numberBetween(4, 10));
                    $activity->setComplexityLevel($faker->randomElement(['Facile', 'Moyen', 'Expert']));
                }

                // Champs communs
                $activity->setTitle($faker->words(3, true));
                $activity->setDescription($faker->text(100));
                
                $actStart = (clone $startDate)->modify('+' . rand(1, 10) . ' hours');
                $activity->setStartAt($actStart);
                
                $activity->setRoom('Salle ' . $faker->randomLetter() . $faker->numberBetween(1, 10));
                $activity->setEvent($event);

                // Participants
                $randomParticipants = $faker->randomElements($users, rand(0, 10));
                foreach ($randomParticipants as $participant) {
                    $activity->addParticipant($participant);
                }

                $manager->persist($activity);
            }
        }

        $manager->flush();
    }
}