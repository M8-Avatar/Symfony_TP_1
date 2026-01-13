<?php

namespace App\Form;

use App\Entity\BoardGameActivity;
use App\Entity\Event;
use App\Entity\User;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class BoardGameType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            // Champs communs
            ->add('title', null, ['label' => 'Titre', 'attr' => ['class' => 'form-input']])
            ->add('description', null, ['label' => 'Description', 'attr' => ['class' => 'form-textarea']])
            ->add('startAt', \Symfony\Component\Form\Extension\Core\Type\DateTimeType::class, [
                'label' => 'Heure de début',
                'widget' => 'single_text',
                'attr' => ['class' => 'form-input']
            ])
            ->add('room', null, ['label' => 'Salle', 'attr' => ['class' => 'form-input']])

            // Champs spécifiques (Jeu de plateau)
            ->add('gameName', null, ['label' => 'Nom du jeu (ex: Catan)', 'attr' => ['class' => 'form-input']])
            ->add('minPlayers', \Symfony\Component\Form\Extension\Core\Type\IntegerType::class, ['label' => 'Min Joueurs', 'attr' => ['class' => 'form-input']])
            ->add('maxPlayers', \Symfony\Component\Form\Extension\Core\Type\IntegerType::class, ['label' => 'Max Joueurs', 'attr' => ['class' => 'form-input']])
            ->add('complexityLevel', \Symfony\Component\Form\Extension\Core\Type\ChoiceType::class, [
                'label' => 'Complexité',
                'choices' => ['Débutant' => 'Facile', 'Intermédiaire' => 'Moyen', 'Expert' => 'Expert'],
                'attr' => ['class' => 'form-input']
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
