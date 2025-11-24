Tellement d'inspiration que je prends celui par défaut.

GeekEvents – Projet Symfony

Ce projet aurait pour objectif de proposer une plateforme permettant d’organiser et de gérer des événements liés à la culture geek : conventions, tournois e-sport, projections, soirées jeux de société, etc.
L’application serait développée en Symfony et utiliserait Doctrine pour la gestion du modèle de données.

L’application viserait à permettre :

aux organisateurs de créer et gérer leurs événements,
aux participants de s’inscrire à des activités,
aux intervenants de participer aux différentes animations proposées.

J’aurais pour but d’y intégrer une structure claire, plusieurs relations entre entités, ainsi qu’un système minimal de gestion d’utilisateurs.


L’application proposerait au minimum :

-un système d’inscription / connexion,
-un espace utilisateur,
-une liste d’événements,
-un détail complet pour chaque événement,
-la création, modification et suppression d’un événement (réservé aux organisateurs),
-des activités liées à un événement,
-l’inscription des participants aux activités.

Le projet reposerait sur plusieurs entités principales :

-User
-Profile
-Event
-Activity
-TournamentActivity
-BoardGameActivity

Les relations suivantes seraient mises en place :

-Héritage entre Activity et ses sous-types.
-OneToOne entre User et Profile.
-OneToMany entre User (organisateur) et Event.
-OneToMany entre Event et Activity.
-ManyToMany entre User (participant) et Activity pour les inscriptions.

Maquettes

Je préparerais différentes maquettes pour visualiser l’application avant le développement :

-Maquettes du site / vues : pages d’accueil, liste des événements, détail d’un événement, espace utilisateur, inscription / connexion, etc.
-Maquette de la base de données : représentation des tables et de leurs relations (vue simple du modèle de données).
-Ces maquettes permettraient de valider l’ergonomie et la structure générale du projet.

Cas d’utilisation

Je rédigerais des cas d’utilisation pour décrire les principaux scénarios d’interaction avec l’application, par exemple :

-Un participant consulterait la liste des événements et s’inscrirait à une activité.
-Un organisateur créerait un nouvel événement et y ajouterait des activités.

Ces cas d’utilisation aideraient à clarifier le comportement attendu du système.

Diagramme UML

Je proposerais un diagramme UML (principalement un diagramme de classes) pour représenter :

-les entités principales,
-leurs attributs,
-les relations entre elles (héritage, OneToOne, OneToMany, ManyToMany).

Ce diagramme servirait de base au modèle Doctrine.

Schéma d’enchaînement des maquettes

Je fournirais également un schéma montrant l’enchaînement des différentes vues/pages de l’application (un mini “diagramme de navigation”) :

-par exemple, comment on passerait de la page d’accueil à la liste des événements, puis au détail, puis à l’inscription, etc.

Ce schéma permettrait de visualiser le parcours utilisateur dans l’application.
