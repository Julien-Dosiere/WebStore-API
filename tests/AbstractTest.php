<?php

namespace App\Tests;

use ApiPlatform\Core\Bridge\Symfony\Bundle\Test\ApiTestCase;
use ApiPlatform\Core\Bridge\Symfony\Bundle\Test\Client;
//use Hautelook\AliceBundle\PhpUnit\RefreshDatabaseTrait;

abstract class AbstractTest extends ApiTestCase
{
    private $token;
    private $clientWithCredentials;

    //use RefreshDatabaseTrait;

    public function setUp(): void
    {
        self::bootKernel();
    }

    protected function createClientWithCredentials($token = null): Client
    {
        $token = $token ?: $this->getToken();

        return static::createClient([], [
            'headers' => ['authorization' => 'Bearer '.$token]
        ]);
    }

    /**
     * Use other credentials if needed.
     */
    protected function getToken($body = []): string
    {
        if ($this->token) {
            return $this->token;
        }

//        $response = static::createClient()->request('POST', '/login', ['body' => $body ?: [
//            'email' => 'admin@admin.com',
//            'password' => 'password',
//        ]]);

        $response = self::createClient()->request(
            'POST',
            '/login',
            ['json' => [
                'email' => 'admin@admin.com',
                'password' => 'password'
            ]]
        );

        $this->assertResponseIsSuccessful();
        $data = json_decode($response->getContent());
        $this->token = $data->token;

        return $data->token;
    }
}
