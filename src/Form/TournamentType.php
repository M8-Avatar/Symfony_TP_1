<?php

namespace App\Form;

use App\Entity\TournamentActivity;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class TournamentType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('title', null, ['label' => 'Titre de l\'activité', 'attr' => ['class' => 'form-input']])
            ->add('description', null, ['label' => 'Description', 'attr' => ['class' => 'form-textarea', 'rows' => 3]])
            ->add('startAt', DateTimeType::class, [
                'label' => 'Heure de début',
                'widget' => 'single_text',
                'attr' => ['class' => 'form-input']
            ])
            ->add('room', null, ['label' => 'Salle / Emplacement', 'attr' => ['class' => 'form-input']])
            
            ->add('game', TextType::class, [
                'label' => 'Jeu',
                'attr' => [
                    'class' => 'js-tom-select-text',
                    'placeholder' => 'Sélectionnez ou ajoutez un jeu...',
                    'data-options' => json_encode([
                        'League of Legends', 'CS:GO / CS2', 'Valorant', 
                        'Super Smash Bros', 'FIFA / FC 24', 'Street Fighter 6', 
                        'Rocket League', 'Tekken 8'
                    ])
                ]
            ])
            
            ->add('platform', ChoiceType::class, [
                'label' => 'Plateforme',
                'choices' => ['PC' => 'PC', 'PS5' => 'PS5', 'Xbox' => 'Xbox', 'Switch' => 'Switch'],
                'attr' => ['class' => 'js-tom-select-no-create']
            ])
            ->add('format', ChoiceType::class, [
                'label' => 'Format',
                'choices' => ['1v1' => '1v1', '5v5' => '5v5', 'Battle Royale' => 'Battle Royale'],
                'attr' => ['class' => 'js-tom-select-no-create']
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