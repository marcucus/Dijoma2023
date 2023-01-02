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

}
