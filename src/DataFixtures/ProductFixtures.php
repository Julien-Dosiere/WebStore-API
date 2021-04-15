<?php

namespace App\DataFixtures;

use App\Entity\Product;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class ProductFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        for($i=1; $i<=5; $i++){
            $product = new Product();
            $product->setName('Product'.$i);
            $product->setDescription('This product description '.$i);
            $product->setPrice(($i*10) + $i + ($i / 10) + ($i / 100));
            $product->setStock($i*2);
            $manager->persist($product);

        }

        $manager->flush();
    }
}
