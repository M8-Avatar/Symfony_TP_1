<?php

namespace App\Entity;

use App\Repository\ProfileRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\HttpFoundation\File\File;
use Vich\UploaderBundle\Mapping\Annotation as Vich;

#[ORM\Entity(repositoryClass: ProfileRepository::class)]
#[Vich\Uploadable]
class Profile
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    // --- VICH UPLOADER ---
    #[ORM\Column(length: 255, nullable: true)]
    private ?string $imageName = null;

    #[Vich\UploadableField(mapping: 'profile_images', fileNameProperty: 'imageName')]
    private ?File $imageFile = null;

    #[ORM\Column(nullable: true)]
    private ?\DateTimeImmutable $updatedAt = null;

    // --- AUTRES CHAMPS ---
    #[ORM\Column(length: 255)]
    private ?string $pseudo = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $avatarUrl = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $bio = null;

    #[ORM\OneToOne(mappedBy: 'profile', cascade: ['persist', 'remove'])]
    private ?User $user = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $favoriteUniverse = null;

    public function __serialize(): array
    {
        return [
            'id' => $this->id,
            'pseudo' => $this->pseudo,
            'bio' => $this->bio,
            'avatarUrl' => $this->avatarUrl,
            'imageName' => $this->imageName,
            'favoriteUniverse' => $this->favoriteUniverse,
            'updatedAt' => $this->updatedAt,
        ];
    }

    public function __unserialize(array $data): void
    {
        $this->id = $data['id'] ?? null;
        $this->pseudo = $data['pseudo'] ?? null;
        $this->bio = $data['bio'] ?? null;
        $this->avatarUrl = $data['avatarUrl'] ?? null;
        $this->imageName = $data['imageName'] ?? null;
        $this->favoriteUniverse = $data['favoriteUniverse'] ?? null;
        $this->updatedAt = $data['updatedAt'] ?? null;
    }

    public function setImageFile(?File $imageFile = null): void
    {
        $this->imageFile = $imageFile;
        if (null !== $imageFile) {
            $this->updatedAt = new \DateTimeImmutable();
        }
    }

    public function getImageFile(): ?File
    {
        return $this->imageFile;
    }

    public function setImageName(?string $imageName): void
    {
        $this->imageName = $imageName;
    }

    public function getImageName(): ?string
    {
        return $this->imageName;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPseudo(): ?string
    {
        return $this->pseudo;
    }

    public function setPseudo(string $pseudo): static
    {
        $this->pseudo = $pseudo;

        return $this;
    }

    public function getAvatarUrl(): ?string
    {
        return $this->avatarUrl;
    }

    public function setAvatarUrl(?string $avatarUrl): static
    {
        $this->avatarUrl = $avatarUrl;

        return $this;
    }

    public function getBio(): ?string
    {
        return $this->bio;
    }

    public function setBio(?string $bio): static
    {
        $this->bio = $bio;

        return $this;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(User $user): static
    {
        if ($user->getProfile() !== $this) {
            $user->setProfile($this);
        }
        $this->user = $user;

        return $this;
    }

    public function getFavoriteUniverse(): ?string
    {
        return $this->favoriteUniverse;
    }

    public function setFavoriteUniverse(?string $favoriteUniverse): static
    {
        $this->favoriteUniverse = $favoriteUniverse;

        return $this;
    }
}