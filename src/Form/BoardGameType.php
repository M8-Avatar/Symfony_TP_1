<?php

namespace App\Form;

use App\Entity\BoardGameActivity;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class BoardGameType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('title', null, ['label' => 'Titre', 'attr' => ['class' => 'form-input']])
            ->add('description', null, ['label' => 'Description', 'attr' => ['class' => 'form-textarea']])
            ->add('startAt', DateTimeType::class, [
                'label' => 'Heure de début',
                'widget' => 'single_text',
                'attr' => ['class' => 'form-input']
            ])
            ->add('room', null, ['label' => 'Salle', 'attr' => ['class' => 'form-input']])

            ->add('gameName', TextType::class, [
                'label' => 'Nom du jeu',
                'attr' => [
                    'class' => 'js-tom-select-text',
                    'placeholder' => 'Ex: Catan, Monopoly...',
                    'data-options' => json_encode([
                        'Catan', 'Les Aventuriers du Rail', '7 Wonders', 
                        'Dixit', 'Loups-garous', 'Monopoly', 'Uno', 'Échecs'
                    ])
                ]
            ])
            
            ->add('minPlayers', IntegerType::class, ['label' => 'Min Joueurs', 'attr' => ['class' => 'form-input']])
            ->add('maxPlayers', IntegerType::class, ['label' => 'Max Joueurs', 'attr' => ['class' => 'form-input']])
            
            ->add('complexityLevel', ChoiceType::class, [
                'label' => 'Complexité',
                'choices' => ['Débutant' => 'Facile', 'Intermédiaire' => 'Moyen', 'Expert' => 'Expert'],
                'attr' => ['class' => 'js-tom-select-no-create']
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => BoardGameActivity::class,
        ]);
    }
}