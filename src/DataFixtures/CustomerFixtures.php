<?php

namespace App\DataFixtures;

use App\Entity\Customer;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class CustomerFixtures extends Fixture
{
    private $encoder;

    public function __construct(UserPasswordEncoderInterface $encoder)
    {
        $this->encoder = $encoder;
    }

    public function load(ObjectManager $manager)
    {
        for($i=1; $i<=5; $i++){
            $customer = new Customer;
            $customer->setName('customer'.$i);
            $customer->setEmail($customer->getName().'@webstore.com');
            $customer->setPassword(
                $this->encoder->encodePassword($customer, 'password'));
            $customer->setAddress('address'.$i);
            $manager->persist($customer);

        }

        $manager->flush();
    }
}
