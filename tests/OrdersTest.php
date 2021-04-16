<?php

namespace App\Tests;

use ApiPlatform\Core\Bridge\Symfony\Bundle\Test\ApiTestCase;
use App\Entity\Order;
use App\Entity\Product;
use App\Entity\Customer;

class OrdersTest extends ApiTestCase
{
    public function testGetOrders(): void
    {
        $response = static::createClient()->request('GET', '/api/orders');

        $this->assertResponseIsSuccessful();
        // Asserts that the returned content type is JSON-LD (the default)
        $this->assertResponseHeaderSame('content-type', 'application/ld+json; charset=utf-8');

        // Asserts that the returned JSON is a superset of this one
        $this->assertJsonContains([
            '@context' => '/api/contexts/Order',
            '@id' => '/api/orders',
            '@type' => 'hydra:Collection',
            //'hydra:totalItems' => 5 //total items

        ]);

        // Because test fixtures are automatically loaded between each test, you can assert on them
        //$this->assertCount(3, $response->toArray()['hydra:member']);  //total per page

        // Asserts that the returned JSON is validated by the JSON Schema generated for this resource by API Platform
        // This generated JSON Schema is also used in the OpenAPI spec!
        $this->assertMatchesResourceCollectionJsonSchema(Order::class);
    }

    public function testCreateDeleteOrder()
    {
        $client = self::createClient();
        $container = $client->getContainer();
        $customers = $container->get('doctrine')->getRepository(Customer::class)->findAll();
        $products = $container->get('doctrine')->getRepository(Product::class)->findAll();

        $productsList = array_map(fn($product) => '/api/products/'.$product->getId(), $products);

        $response = self::createClient()->request(
            'POST',
            '/api/orders',
            ['json' => [
                'customer' => '/api/customers/'.$customers[0]->getId(),
                'products' => $productsList
            ]]
        );

        $this->assertResponseIsSuccessful();
        $this->assertJsonContains([
            '@context' => '/api/contexts/Order',
            '@type' => 'Order',
        ]);

        $orderId = json_decode($response->getContent())->id;

        $response = static::createClient()->request('GET', '/api/orders/'.$orderId );
        $this->assertResponseIsSuccessful();
        $this->assertResponseHeaderSame('content-type', 'application/ld+json; charset=utf-8');
        $this->assertJsonContains([
            '@context' => '/api/contexts/Order',
            '@id' => '/api/orders/'.$orderId ,
            '@type' => 'Order',
        ]);

        $response = static::createClient()->request(
            'DELETE',
            '/api/orders/'.$orderId
        );
        $this->assertResponseIsSuccessful();


        $response = static::createClient()->request('GET', '/api/orders/'.$orderId );

        $this->assertResponseHeaderSame('content-type', 'application/ld+json; charset=utf-8');
        $this->assertResponseStatusCodeSame(404);
        $this->assertJsonContains([
            '@type' => 'hydra:Error',
            'hydra:description' => 'Not Found'
        ]);
    }


}
