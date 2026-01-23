# GeekEvents - Plateforme de Gestion d'Événements

GeekEvents est une application web développée avec **Symfony 7** permettant la gestion complète d'événements liés à la culture Geek (Tournois, Jeux de société, Conventions). Elle met en relation des organisateurs d'événements et des participants passionnés.

Ce projet a été réalisé dans le cadre d'un TP de formation, mettant en œuvre une architecture MVC robuste et des technologies modernes.

---

## Fonctionnalités Principales

### Partie Publique (Front-Office)
* **Catalogue d'événements :** Liste des événements avec recherche et filtres.
* **Détails complets :** Informations, lieu, date, places restantes (jauge dynamique).
* **Inscription/Désinscription :** Gestion fluide des participations aux événements et aux activités spécifiques.
* **Espace Membre :** Profil utilisateur avec avatar, historique des inscriptions et billets.

### Espace Organisateur (Dashboard)
* **Tableau de bord :** Statistiques en temps réel (inscrits, activités, compte à rebours).
* **Gestion complète (CRUD) :** Création et modification d'événements.
* **Gestion des Activités :** Ajout de **Tournois** ou de **Jeux de Société** (via héritage d'entités).
* **Gestion des Participants :** Visualisation et modération des inscrits.

### Administration (Back-Office)
* Interface **EasyAdmin** pour la gestion globale (Utilisateurs, Catégories, Modération).

---

## Choix Techniques

* **Backend :** Symfony 7.1 (PHP 8.4)
* **Base de données :** MySQL / MariaDB (via Doctrine ORM)
* **Frontend :** Twig, Tailwind CSS (compilé via AssetMapper/PostCSS), Stimulus UX.
* **Uploads :** VichUploaderBundle pour la gestion des images (Events & Avatars).
* **Formulaires :** Symfony Forms avec héritage (Activités).



git clone [https://github.com/ton-pseudo/geekevents.git](https://github.com/ton-pseudo/geekevents.git)
cd geekevents
