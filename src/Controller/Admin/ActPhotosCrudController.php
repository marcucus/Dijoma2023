<?php

namespace App\Controller\Admin;

use App\Entity\ActPhotos;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\NumberField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use Vich\UploaderBundle\Form\Type\VichImageType;

class ActPhotosCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return ActPhotos::class;
    }

    public function configureFields(string $pageName): iterable
    {
        yield TextField::new('description');
        yield ImageField::new('imageName', 'Image')->onlyOnIndex()->setBasePath('/images/upload/activite/images');
        yield AssociationField::new('activite')->setColumns(8);
        yield TextareaField::new('imageFile','Image')->hideOnIndex()->setFormType(VichImageType::class)->setColumns(8);
        yield NumberField::new('Position', 'Position dans la photo dans l\'activité')->setColumns(8);
    }

}
