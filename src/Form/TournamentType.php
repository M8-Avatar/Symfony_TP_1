<?php

namespace App\Form;

use App\Entity\Event;
use App\Entity\TournamentActivity;
use App\Entity\User;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class TournamentType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            // Champs communs (Classe Mère)
            ->add('title', null, ['label' => 'Titre de l\'activité', 'attr' => ['class' => 'form-input']])
            ->add('description', null, ['label' => 'Description', 'attr' => ['class' => 'form-textarea', 'rows' => 3]])
            ->add('startAt', \Symfony\Component\Form\Extension\Core\Type\DateTimeType::class, [
                'label' => 'Heure de début',
                'widget' => 'single_text',
                'attr' => ['class' => 'form-input']
            ])
            ->add('room', null, ['label' => 'Salle / Emplacement', 'attr' => ['class' => 'form-input']])
            
            // Champs spécifiques (Tournoi)
            ->add('game', null, ['label' => 'Jeu (ex: LoL, CS:GO)', 'attr' => ['class' => 'form-input']])
            ->add('platform', \Symfony\Component\Form\Extension\Core\Type\ChoiceType::class, [
                'label' => 'Plateforme',
                'choices' => ['PC' => 'PC', 'PS5' => 'PS5', 'Xbox' => 'Xbox', 'Switch' => 'Switch'],
                'attr' => ['class' => 'form-input']
            ])
            ->add('format', \Symfony\Component\Form\Extension\Core\Type\ChoiceType::class, [
                'label' => 'Format',
                'choices' => ['1v1' => '1v1', '5v5' => '5v5', 'Battle Royale' => 'Battle Royale'],
                'attr' => ['class' => 'form-input']
            ])
            ->add('rules', null, ['label' => 'Règles spécifiques', 'attr' => ['class' => 'form-input']])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => TournamentActivity::class,
        ]);
    }
}
