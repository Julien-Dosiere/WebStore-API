<?php

namespace App\Tests;

use ApiPlatform\Core\Bridge\Symfony\Bundle\Test\ApiTestCase;
use ApiPlatform\Core\Bridge\Symfony\Bundle\Test\Client;
use phpDocumentor\Reflection\Types\Boolean;

//use Hautelook\AliceBundle\PhpUnit\RefreshDatabaseTrait;

abstract class AbstractTest extends ApiTestCase
{
    private $token;
    private $clientWithCredentials;
    public ?string $userId = null;

    //use RefreshDatabaseTrait;

    public function setUp(): void
    {
        self::bootKernel();
    }

    protected function createClientWithCredentials(bool $customer = false, $token = null): Client
    {
        $token = $token ?: $this->getToken($customer);

        return static::createClient([], [
            'headers' => ['authorization' => 'Bearer '.$token]
        ]);
    }

    /**
     * Use other credentials if needed.
     */
    protected function getToken(bool $customer, $body = []): string
    {
        if ($this->token) {
            return $this->token;
        }

//        $response = static::createClient()->request('POST', '/login', ['body' => $body ?: [
//            'email' => 'admin@admin.com',
//            'password' => 'password',
//        ]]);
        if ($customer){
            $response = self::createClient()->request(
                'POST',
                '/login',
                ['json' => [
                    'email' => 'customer1@webstore.com',
                    'password' => 'password'
                ]]
            );
        } else {
            $response = self::createClient()->request(
                'POST',
                '/login',
                ['json' => [
                    'email' => 'admin@admin.com',
                    'password' => 'password'
                ]]
            );
        }


        $this->assertResponseIsSuccessful();
        $data = json_decode($response->getContent());
        $this->token = $data->token;
        $this->userId = $data->id;

        return $data->token;
    }
}
