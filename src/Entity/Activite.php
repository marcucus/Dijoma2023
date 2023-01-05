<?php

namespace App\Entity;

use App\Repository\ActiviteRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\HttpFoundation\File\File;
use Vich\UploaderBundle\Mapping\Annotation as Vich;
use Symfony\Component\HttpFoundation\File\UploadedFile;

#[ORM\Entity(repositoryClass: ActiviteRepository::class)]
/**
 * @Vich\Uploadable
 */
class Activite
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column (type: 'integer')]
    private $id;

    #[ORM\Column(type: "string",length: 255, nullable: false)]
    private $titre;

    #[ORM\Column(type: "string",length: 255, nullable: true)]
    private $imageName;

    #[ORM\Column(type: "integer", nullable: true)]
    private $imageSize;

    /**
     * NOTE: This is not a mapped field of entity metadata, just a simple property.
     *
     * @Vich\UploadableField(mapping="activite_images", fileNameProperty="imageName", size="imageSize")
     *
     * @var File|null
     */
    private $imageFile;

    #[ORM\Column(type: 'datetime_immutable', nullable: true)]
    private $updatedAt;

    #[ORM\Column(type: 'text', nullable: true)]
    private $description;

    #[ORM\OneToMany(mappedBy: 'activite', targetEntity: ActPhotos::class, cascade: ['remove'], orphanRemoval: true)]
    private $actPhotos;

    public function __construct()
    {
        $this->updatedAt = new \DateTimeImmutable();
        $this->actPhotos = new ArrayCollection();
    }

    public function __toString()
    {
        return $this->titre;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUpdatedAt(): ?\DateTimeImmutable
    {
        return $this->updatedAt;
    }

    public function setUpdatedAt(?\DateTimeImmutable $updatedAt): self
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }

    public function setDescription(?string $description): void
    {
        $this->description = $description;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    /**
     * If manually uploading a file (i.e. not using Symfony Form) ensure an instance
     * of 'UploadedFile' is injected into this setter to trigger the update. If this
     * bundle's configuration parameter 'inject_on_load' is set to 'true' this setter
     * must be able to accept an instance of 'File' as the bundle will inject one here
     * during Doctrine hydration.
     *
     * @param File|\Symfony\Component\HttpFoundation\File\UploadedFile|null $imageFile
     */
    public function setImageFile(?File $imageFile = null): void
    {
        $this->imageFile = $imageFile;

        if (null !== $imageFile) {
            // It is required that at least one field changes if you are using doctrine
            // otherwise the event listeners won't be called and the file is lost
            $this->updatedAt = new \DateTimeImmutable();
        }
    }

    public function getImageFile(): ?File
    {
        return $this->imageFile;
    }

    public function setTitle(?string $titre): void
    {
        $this->titre = $titre;
    }

    public function getTitle(): ?string
    {
        return $this->titre;
    }

    public function setImageName(?string $imageName): void
    {
        $this->imageName = $imageName;
    }

    public function getImageName(): ?string
    {
        return $this->imageName;
    }

    public function setImageSize(?int $imageSize): void
    {
        $this->imageSize = $imageSize;
    }

    public function getImageSize(): ?int
    {
        return $this->imageSize;
    }

    /**
     * @return Collection|ActPhotos[]
     */
    public function getActPhotos(): Collection
    {
        return $this->actPhotos;
    }

    public function addActPhoto(ActPhotos $actPhoto): self
    {
        if (!$this->actPhotos->contains($actPhoto)) {
            $this->actPhotos->add($actPhoto);
            $actPhoto->setActivite($this);
        }

        return $this;
    }

    public function removeActPhoto(ActPhotos $actPhoto): self
    {
        if ($this->actPhotos->removeElement($actPhoto)) {
            // set the owning side to null (unless already changed)
            if ($actPhoto->getActivite() === $this) {
                $actPhoto->setActivite(null);
            }
        }

        return $this;
    }
}
