<?php

namespace App\DataFixtures;

use App\Entity\BoardGameActivity;
use App\Entity\Event;
use App\Entity\Intervenant;
use App\Entity\Profile;
use App\Entity\Registration;
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
        $faker = Factory::create('fr_FR');

        // --- 1. UTILISATEURS ---
        $users = [];
        $organizers = [];

        // A. Super Admin
        $admin = new User();
        $admin->setEmail('admin@geekevents.com');
        $admin->setRoles(['ROLE_ADMIN']);
        $admin->setPassword($this->hasher->hashPassword($admin, 'password'));
        
        $profileAdmin = new Profile();
        $profileAdmin->setPseudo('AdminGeek');
        $profileAdmin->setBio('Le maître du donjon.');
        $admin->setProfile($profileAdmin);
        
        $manager->persist($admin);

        // B. Organisateurs (5)
        for ($i = 0; $i < 5; $i++) {
            $org = new User();
            $org->setEmail('organizer' . $i . '@geekevents.com');
            $org->setRoles(['ROLE_ORGANIZER']);
            $org->setPassword($this->hasher->hashPassword($org, 'password'));
            
            $profileOrg = new Profile();
            $profileOrg->setPseudo($faker->userName());
            $profileOrg->setBio($faker->sentence());
            $org->setProfile($profileOrg);

            $manager->persist($org);
            $organizers[] = $org;
        }

        // C. Utilisateurs classiques (30)
        for ($i = 0; $i < 30; $i++) {
            $user = new User();
            $user->setEmail($faker->email());
            $user->setRoles(['ROLE_USER']);
            $user->setPassword($this->hasher->hashPassword($user, 'password'));

            $profileUser = new Profile();
            $profileUser->setPseudo($faker->userName());
            $profileUser->setFavoriteUniverse($faker->randomElement(['Marvel', 'Star Wars', 'Manga', 'Warhammer', 'Zelda']));
            $user->setProfile($profileUser);

            $manager->persist($user);
            $users[] = $user;
        }

        // --- 2. INTERVENANTS (10) ---
        $intervenants = [];
        for ($i = 0; $i < 10; $i++) {
            $intervenant = new Intervenant();
            $intervenant->setName($faker->name());
            $intervenant->setBio($faker->paragraph(2));
            
            $manager->persist($intervenant);
            $intervenants[] = $intervenant;
        }

        // --- 3. ÉVÉNEMENTS (20) ---
        $categories = ['Tournoi E-sport', 'Convention', 'Jeux de Société', 'Conférence', 'Cosplay'];
        $locations = ['Paris Expo', 'Eurexpo Lyon', 'Salle des fêtes locale', 'Discord / Online'];

        for ($i = 0; $i < 20; $i++) {
            $event = new Event();
            $event->setOrganizer($faker->randomElement($organizers));
            $event->setTitle($faker->sentence(3));
            $event->setDescription($faker->paragraph(5));
            $event->setCategory($faker->randomElement($categories));
            $event->setLocation($faker->randomElement($locations));
            $event->setCapacity($faker->numberBetween(20, 500));
            
            // CORRECTION ICI : On utilise directement les objets DateTime de Faker (Mutable)
            $startAt = $faker->dateTimeBetween('-2 months', '+6 months');
            $endAt = (clone $startAt)->modify('+' . $faker->numberBetween(1, 3) . ' days');
            
            $event->setStartAt($startAt);
            $event->setEndAt($endAt);

            // Ajouter des intervenants aléatoires
            $randomIntervenants = $faker->randomElements($intervenants, $faker->numberBetween(0, 3));
            foreach ($randomIntervenants as $inv) {
                $event->addIntervenant($inv);
            }

            $manager->persist($event);

            // --- 4. ACTIVITÉS (1 à 4 par event) ---
            $numActivities = $faker->numberBetween(1, 4);
            for ($j = 0; $j < $numActivities; $j++) {
                
                if ($faker->boolean(50)) {
                    // Tournoi
                    $activity = new TournamentActivity();
                    $activity->setGame($faker->randomElement(['League of Legends', 'Valorant', 'Smash Bros', 'FIFA']));
                    $activity->setPlatform($faker->randomElement(['PC', 'PS5', 'Switch']));
                    $activity->setFormat($faker->randomElement(['1v1', '5v5', 'Battle Royale']));
                    $activity->setRules("Règles officielles v" . $faker->randomDigit());
                } else {
                    // Jeu de plateau
                    $activity = new BoardGameActivity();
                    $activity->setGameName($faker->randomElement(['Catan', 'Dune Imperium', '7 Wonders', 'Ark Nova']));
                    $activity->setMinPlayers(2);
                    $activity->setMaxPlayers(6);
                    $activity->setComplexityLevel($faker->randomElement(['Facile', 'Moyen', 'Expert']));
                }

                $activity->setEvent($event);
                $activity->setTitle($faker->words(3, true));
                $activity->setDescription($faker->paragraph(1));
                $activity->setRoom('Salle ' . $faker->randomLetter() . $faker->randomDigit());
                
                // CORRECTION ICI : Date de l'activité
                $actStart = (clone $startAt)->modify('+' . $faker->numberBetween(1, 10) . ' hours');
                $activity->setStartAt($actStart);

                // Inscrire quelques users aux activités
                $randomParticipants = $faker->randomElements($users, $faker->numberBetween(0, 5));
                foreach ($randomParticipants as $p) {
                    $activity->addParticipant($p);
                }

                $manager->persist($activity);
            }

            // --- 5. INSCRIPTIONS GLOBALES ---
            $randomRegistrants = $faker->randomElements($users, $faker->numberBetween(5, 15));
            foreach ($randomRegistrants as $registrant) {
                $registration = new Registration();
                $registration->setUser($registrant);
                $registration->setEvent($event);
                
                // CORRECTION ICI : Date d'inscription
                // On s'assure que la date d'inscription est valide (DateTime ou DateTimeImmutable selon ton entité Registration)
                // Par sécurité, on envoie un DateTimeImmutable ici si ton entité Registration l'exige (souvent le cas pour created_at/registered_at)
                // Si ça plante ici, change en DateTime simple.
                // Essayons d'abord DateTimeImmutable car c'est souvent le défaut pour les timestamps
                $registration->setRegisteredAt(\DateTimeImmutable::createFromMutable($faker->dateTimeBetween('-1 month', 'now')));
                
                $manager->persist($registration);
            }
        }

        $manager->flush();
    }
}