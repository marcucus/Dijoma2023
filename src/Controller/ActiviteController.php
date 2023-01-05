<?php

namespace App\Controller;

use App\Entity\Activite;
use App\Repository\ActiviteRepository;
use App\Repository\ActPhotosRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ActiviteController extends AbstractController
{
    #[Route('/activite', name: 'app_activite')]
    public function index(ActiviteRepository $activiteRepository, Request $request): Response
    {
        $actQuery = $activiteRepository->findAll();

        return $this->render('activite/index.html.twig', [
            'activites' => $actQuery,
        ]);
    }

    #[Route('/activite/{id}', name: 'ActPhoto', methods: ['GET'])]
    public function show(Activite $activite, ActPhotosRepository $actPhotosRepository, ActiviteRepository $activiteRepository): Response
    {
        $id = $activite->getId();
        $actQuery = $activiteRepository->findAll();
        $PhotoQuery = $actPhotosRepository->findPhotosByIdAct($id);
        return $this->render('activite/index.html.twig', [
            'activites' => $actQuery,
            'photos'=>$PhotoQuery,
        ]);
    }

    #[Route('/activiteInfo/{id}', name: 'moreInfo', methods: ['GET'])]
    public function showInfo(Activite $activite, ActPhotosRepository $actPhotosRepository, ActiviteRepository $activiteRepository): Response
    {
        $id = $activite->getId();
        $actQuery = $activiteRepository->find($id);
        return $this->render('activite/show.html.twig', [
            'activites' => $actQuery,
        ]);
    }
}
