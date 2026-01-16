<?php

namespace App\Form;

use App\Entity\User;
use App\Form\ProfileType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Length;

class UserType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('email', EmailType::class, [
                'label' => 'Adresse Email',
                'attr' => ['class' => 'bg-background text-foreground border border-input rounded-md p-2 w-full']
            ])
            ->add('profile', ProfileType::class, [
                'label' => false,
            ])
            ->add('plainPassword', RepeatedType::class, [
                'type' => PasswordType::class,
                'mapped' => false,
                'required' => false,
                'first_options'  => [
                    'label' => 'Nouveau mot de passe (laisser vide pour ne pas changer)',
                    'attr' => ['class' => 'bg-background text-foreground border border-input rounded-md p-2 w-full'],
                    'hash_property_path' => 'password',
                ],
                'second_options' => [
                    'label' => 'Confirmer le mot de passe',
                    'attr' => ['class' => 'bg-background text-foreground border border-input rounded-md p-2 w-full mt-2'],
                ],
                'constraints' => [
                    new Length(
                        min: 6,
                        minMessage: 'Le mot de passe doit faire au moins {{ limit }} caractères',
                        max: 4096,
                    ),
                ],
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}