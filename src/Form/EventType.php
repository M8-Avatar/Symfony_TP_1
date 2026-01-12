<?php

namespace App\Form;

use App\Entity\Event;
use App\Entity\User;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class EventType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('title', TextType::class, [
                'label' => 'Titre de l\'événement',
                'attr' => ['class' => 'flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm text-foreground', 'placeholder' => 'Ex: LAN Party 2026']
            ])
            ->add('category', ChoiceType::class, [
                'label' => 'Catégorie',
                'choices' => [
                    'Tournoi E-sport' => 'Tournoi E-sport',
                    'Convention' => 'Convention',
                    'Jeux de Société' => 'Jeux de Société',
                    'Conférence' => 'Conférence'
                ],
                'attr' => ['class' => 'flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm text-foreground']
            ])
            ->add('description', TextareaType::class, [
                'label' => 'Description détaillée',
                'attr' => ['class' => 'flex min-h-[80px] w-full rounded-md border border-input bg-background px-3 py-2 text-sm text-foreground', 'rows' => 5]
            ])
            ->add('startAt', DateTimeType::class, [
                'label' => 'Date de début',
                'widget' => 'single_text',
                'html5' => true,
                'attr' => ['class' => 'flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm text-foreground']
            ])
            ->add('endAt', DateTimeType::class, [
                'label' => 'Date de fin',
                'widget' => 'single_text',
                'html5' => true,
                'attr' => ['class' => 'flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm text-foreground']
            ])
            ->add('location', TextType::class, [
                'label' => 'Lieu',
                'attr' => [
                    'class' => 'flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm text-foreground',
                    'list' => 'locations-list',
                    'placeholder' => 'Sélectionnez ou tapez un lieu'
                ]
            ])
            ->add('capacity', IntegerType::class, [
                'label' => 'Capacité max',
                'attr' => ['class' => 'flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm text-foreground']
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Event::class,
        ]);
    }
}
