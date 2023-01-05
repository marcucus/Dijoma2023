<?php

namespace App\Controller\Admin;

use App\Entity\Activite;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\NumberField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use Vich\UploaderBundle\Form\Type\VichImageType;

class ActiviteCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Activite::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            NumberField::new('id')->setColumns(8)->hideOnForm(),
            ImageField::new('imageName', 'Image')->onlyOnIndex()->setBasePath('/images/upload/activite/'),
            TextField::new('title')->setColumns(8),
            TextareaField::new('imageFile')->hideOnIndex()->setFormType(VichImageType::class)->setColumns(8),
            TextareaField::new('description')->setColumns(8),
        ];
    }

}
