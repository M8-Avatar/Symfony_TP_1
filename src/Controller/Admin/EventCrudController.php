<?php

namespace App\Controller\Admin;

use App\Entity\Event;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;


class EventCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Event::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')->hideOnForm(),
            TextField::new('title', 'Titre'),
            TextField::new('category', 'Catégorie'),
            
            // Pour l'image, on utilise le dossier d'upload qu'on a configuré avec Vich
            ImageField::new('imageName', 'Image')
                ->setBasePath('/uploads/events')
                ->setUploadDir('public/uploads/events')
                ->setRequired(false),

            DateTimeField::new('startAt', 'Début'),
            DateTimeField::new('endAt', 'Fin'),
            
            IntegerField::new('capacity', 'Capacité'),
            
            // Relation avec l'Organisateur (User)
            AssociationField::new('organizer', 'Organisateur'),
        ];
    }
}