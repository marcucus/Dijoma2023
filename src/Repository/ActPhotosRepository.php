<?php

namespace App\Repository;

use App\Entity\ActPhotos;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<ActPhotos>
 *
 * @method ActPhotos|null find($id, $lockMode = null, $lockVersion = null)
 * @method ActPhotos|null findOneBy(array $criteria, array $orderBy = null)
 * @method ActPhotos[]    findAll()
 * @method ActPhotos[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ActPhotosRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ActPhotos::class);
    }

    public function save(ActPhotos $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(ActPhotos $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function findPhotosByIdAct(int $id): array
    {
        $entityManager = $this->getEntityManager();
        $query = $entityManager->createQuery(
            'SELECT DISTINCT p
                 FROM App\Entity\ActPhotos p
                 INNER JOIN App\Entity\Activite a with p.activite=a.id
                 WHERE p.activite = :id
                 ORDER BY p.position ASC'
        )->setParameter('id', $id)->getArrayResult();
        return $query;
    }

//    /**
//     * @return ActPhotos[] Returns an array of ActPhotos objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('a')
//            ->andWhere('a.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('a.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?ActPhotos
//    {
//        return $this->createQueryBuilder('a')
//            ->andWhere('a.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
