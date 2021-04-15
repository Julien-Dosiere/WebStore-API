<?php

namespace App\DataFixtures;

use App\Entity\Customer;
use App\Entity\Order;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class OrderFictures extends Fixture
{
    public function load(ObjectManager $manager)
    {

        $customersColection = $manager
            ->getRepository(Customer::class)
            ->findAll();

        foreach ($customersColection as $customer){
            $order = new Order();
            $order->setCustomer($customer);
            $manager->persist($order);
        }

        $manager->flush();

    }

    public function getDependencies()
    {
        return [
            CustomerFixtures::class,
        ];
    }
}
