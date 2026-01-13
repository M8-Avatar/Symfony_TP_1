<?php

namespace App\Form;

use App\Entity\Profile;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ProfileType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('pseudo', TextType::class, [
                'label' => 'Pseudo',
                'attr' => ['class' => 'flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm text-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring']
            ])
            ->add('bio', TextareaType::class, [
                'label' => 'Ma Bio',
                'required' => false,
                'attr' => ['class' => 'flex min-h-[80px] w-full rounded-md border border-input bg-background px-3 py-2 text-sm text-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring', 'rows' => 4]
            ])
            ->add('favoriteUniverse', ChoiceType::class, [
                'label' => 'Univers Favori',
                'required' => false,
                'choices' => [
                    'Fantasy (D&D, LOTR)' => 'Fantasy',
                    'Sci-Fi (Star Wars, Dune)' => 'Sci-Fi',
                    'Horreur (Cthulhu)' => 'Horreur',
                    'Super-Héros' => 'Super-Héros',
                    'Cyberpunk' => 'Cyberpunk',
                    'Historique' => 'Historique'
                ],
                'attr' => ['class' => 'flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm text-foreground']
            ])
            // On pourra ajouter l'avatar upload plus tard si tu veux
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Profile::class,
        ]);
    }
}