<?php

namespace App\DataFixtures;

use App\Entity\Offer;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class OfferFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        for($i=1; $i<=5; $i++){
            $offer = new Offer;
            $offer->setName('Offer '.$i);
            $offer->setType('type '.$i);
            $offer->setValue($i*10);
            $offer->setDescription('This is Description '.$i);

            $offer->setValidFrom(new \DateTime("now"));

            $offer->setValidThrough(new \DateTime("next month"));
            $manager->persist($offer);

        }


        $manager->flush();
    }
}
