<?php

namespace App\Controller\Admin;

use App\Entity\Intervenant;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use Vich\UploaderBundle\Form\Type\VichImageType;

class IntervenantCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Intervenant::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('name', 'Nom complet'),
            TextareaField::new('bio', 'Biographie')->hideOnIndex(),
            
            TextField::new('imageFile', 'Photo')
                ->setFormType(VichImageType::class)
                ->onlyOnForms(),
            
            ImageField::new('imageName', 'Photo')
                ->setBasePath('/uploads/intervenants')
                ->onlyOnIndex(),

            // Voir à quels événements il participe
            AssociationField::new('events', 'Événements associés')
                ->hideOnForm(), // On gère l'association plutôt depuis l'événement
        ];
    }
}