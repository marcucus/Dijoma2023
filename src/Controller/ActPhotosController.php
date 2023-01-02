<?php

namespace App\Controller;

use App\Entity\Activite;
use App\Repository\ActiviteRepository;
use App\Repository\ActPhotosRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ActPhotosController extends AbstractController
{
    #[Route('/act/photos', name: 'app_act_photos')]
    public function index(): Response
    {
        return $this->render('act_photos/index.html.twig', [
            'controller_name' => 'ActPhotosController',
        ]);
    }

    #[Route('/act/photos/{id}', name: 'ActPhoto_show', methods: ['GET'])]
    public function show(Activite $activite, ActPhotosRepository $actPhotosRepository, ActiviteRepository $activiteRepository): Response
    {
        $id = $activite->getId();
        $ActQuery = $activiteRepository->findBy(array('id'=>$id));
        $PhotoQuery = $actPhotosRepository->findPhotosByIdAct($id);
        return $this->render('activite/show.html.twig', [
            'activites' => $ActQuery,
            'photos' => $PhotoQuery,
        ]);
    }
}
