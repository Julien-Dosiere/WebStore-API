 # WebStore API
 
Webstore API is a backend app developed with Symfony & API-Platform. Its main role is to 
serve data to customer and back office frontend apps, implementing REST principles.

This is deployed and available at https://webstore-api-jd.herokuapp.com/api.

### Data structure
The API would enable data management of customer, products, order, offers and employee.
Please check the [MCD](doc/MCD/webstore-api.svg) to get more details about data fields 
and their relations.

You will find the list of all possible requests at the endpoint '/api'.

Not mentioned in that page is **image upload** for product which is available at the 
endpoint **'/upload'** 
(needs a form-data body containing fields "imageFile" & "product_id").  


### Authentication & permissions

The API use 3 kinds of users:
- Non-authenticated which only allows products & offers reading, and customer profile 
  POST.  
- Customer profile which allows order placing and modify its own profile datas
- Employee profile which allows everything.

The API use JWT for employee & customers authentication. **Login** is available at the 
endpoint **"/login"** (POST method). It required registered employee or customer 
email & password (json format).  

You might want **change the passphrase and generate new pem keys** (./config/jwt) if you 
are planning to use this API on a public server:
1. Change the `JWT_PASSPHRASE` in the .env file
2. Generate new public & private key using your new passphrase with the following 
   commands:
```
$ openssl genrsa -out config/jwt/private.pem -aes256 4096
$ openssl rsa -pubout -in config/jwt/private.pem -out config/jwt/public.pem
```

## Getting started

### Prerequisites:
This app requires **PHP 7.4 or above and Composer** installed on your system to 
work properly.

### Installation
1. Clone this repo
2. Install dependencies with the following command:
```
$ composer install
```
3. Create a database and configure your DB connection in the .env file. By Default, the 
   app requires a localhost PostgreSQL database called 'webstore' with a 'webstore' 
   user and 'webstore' also as password

4. Run migrations to create your database structure with the following command (you can 
   also import the database-import.sql file which would create database structure & seeds)
```
$ bin/console doctrine:migration:migrate
```

5. You should be able to run your server by now using the command:
```
$ symfony serve
```
It uses port 8000 as default. Go to http://127.0.0.1:8000/api to access the endpoints list

Your app is up and running (though the database is empty) !!

#### Optional: populate & test the API

6. If you haven't use the database-import.sql file, seeds your database by running 
   this command:
```
$ bin/console doctrine:fixtures:load
```

7. Run unit tests (requires above DB seeding) :
```
$ ./vendor/bin/phpunit --testdox
```



