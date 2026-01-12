<?php

namespace App\Entity;

use App\Repository\ActivityRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ActivityRepository::class)]
class BoardGameActivity extends Activity
{
    #[ORM\Column(length: 255, nullable: true)]
    private ?string $gameName = null;

    #[ORM\Column(nullable: true)]
    private ?int $minPlayers = null;

    #[ORM\Column(nullable: true)]
    private ?int $maxPlayers = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $complexityLevel = null;

    public function getGameName(): ?string
    {
        return $this->gameName;
    }

    public function setGameName(?string $gameName): self
    {
        $this->gameName = $gameName;

        return $this;
    }

    public function getMinPlayers(): ?int
    {
        return $this->minPlayers;
    }

    public function setMinPlayers(?int $minPlayers): self
    {
        $this->minPlayers = $minPlayers;

        return $this;
    }

    public function getMaxPlayers(): ?int
    {
        return $this->maxPlayers;
    }

    public function setMaxPlayers(?int $maxPlayers): self
    {
        $this->maxPlayers = $maxPlayers;

        return $this;
    }

    public function getComplexityLevel(): ?string
    {
        return $this->complexityLevel;
    }

    public function setComplexityLevel(?string $complexityLevel): self
    {
        $this->complexityLevel = $complexityLevel;

        return $this;
    }
}