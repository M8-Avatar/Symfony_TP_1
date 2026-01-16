<?php

namespace App\Form;

use App\Entity\Event;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Vich\UploaderBundle\Form\Type\VichImageType;

class EventType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('title', TextType::class, [
                'label' => 'Titre de l\'événement',
                'attr' => ['class' => 'form-input', 'placeholder' => 'Ex: LAN Party 2026']
            ])
            // Transformation en TextType + TomSelect
            ->add('category', TextType::class, [
                'label' => 'Catégorie',
                'attr' => [
                    'class' => 'js-tom-select-text',
                    'placeholder' => 'Sélectionnez ou créez une catégorie...',
                    'data-options' => json_encode([
                        'Tournoi E-sport',
                        'Convention',
                        'Jeux de Société',
                        'Conférence'
                    ])
                ]
            ])
            ->add('description', TextareaType::class, [
                'label' => 'Description détaillée',
                'attr' => ['class' => 'form-textarea', 'rows' => 5]
            ])
            ->add('startAt', DateTimeType::class, [
                'label' => 'Date de début',
                'widget' => 'single_text',
                'html5' => true,
                'attr' => ['class' => 'form-input']
            ])
            ->add('endAt', DateTimeType::class, [
                'label' => 'Date de fin',
                'widget' => 'single_text',
                'html5' => true,
                'attr' => ['class' => 'form-input']
            ])
            ->add('location', TextType::class, [
                'label' => 'Lieu',
                'attr' => [
                    'class' => 'js-tom-select-text',
                    'placeholder' => 'Sélectionnez ou écrivez un lieu...',
                    'data-options' => json_encode([
                        'Paris Expo Porte de Versailles',
                        'Eurexpo Lyon',
                        'Paris La Défense Arena',
                        'Online / Discord',
                        'Salle des fêtes locale'
                    ])
                ]
            ])
            ->add('capacity', IntegerType::class, [
                'label' => 'Capacité max',
                'attr' => ['class' => 'form-input']
            ])
            ->add('imageFile', VichImageType::class, [
                'label' => 'Image de couverture',
                'required' => false,
                'allow_delete' => true,
                'download_uri' => false,
                'attr' => ['class' => 'mb-4']
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