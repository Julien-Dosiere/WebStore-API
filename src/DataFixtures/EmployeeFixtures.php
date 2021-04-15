<?php

namespace App\DataFixtures;

use App\Entity\Employee;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class EmployeeFixtures extends Fixture
{
    private $encoder;

    public function __construct(UserPasswordEncoderInterface $encoder)
    {
        $this->encoder = $encoder;
    }

    public function load(ObjectManager $manager)
    {
        // $product = new Product();
        // $manager->persist($product);
        $employee = new Employee();
        $employee->setName('admin');
        $employee->setPassword(
            $this->encoder->encodePassword($employee, 'password')
        );
        $employee->setRole(['ROLE_ADMIN']);
        $employee->setEmail('admin@admin.com');

        $manager->persist($employee);


        $manager->flush();
    }
}
