 # WebStore API
 
Webstore API is a backend app developed with Symfony & API-plateform. Its main role is to 
serve data to customer and back office frontend apps, implementing REST principles.

The API would enable management of customer, products, order & offers. 

It implements JWT for staff members authentication.

## Getting started

### Prerequisites:
This app requires PHP version 7.4 or above and Composer installed on your system to 
work properly.

### Installation
1. Clone this repo
2. Install dependencies
```
$ composer install
```
3. Create a database and configure your connection in the .env file. By Default, the 
   app requires a localhost PostgreSQL database called 'webstore' with a 'webstore' 
   user and 'webstore' also as password

4. Run migrations to create your database structure with following command (you can 
   also import the database-import.sql file which would create databaser structure & seeds)
```
$ bin/console doctrine:migration:migrate
```

5. You should be able to run your server by now using the command:
```
$ symfony serve
```
It uses port 8000 as default. Got to http://127.0.0.1:8000/api to your local server documentation

Your app is up and running (with the empty database) !!

#### Optional: populate & test the API

6. If you havent use the database-import.sql file, seeds your database by running 
   following commands:
```
$ bin/console doctrine:fixtures:load
```

7. Run unit tests (requires above DB seeding) :
```
$ ./vendor/bin/phpunit --testdox
```



