
# Jungle - Mini E-commerce App

Jungle is a simple e-commerce application built with Rails 6.1. Users can buy plaents and admins can add and remove product.

## Features

### Browse Products
  Users can browse all items for sale.
  Users can click on items to view more details.
  Users can add items to cart.

### Purchase Items
  Users can view items in cart.
  Users can checkout items usin stripe.

### Adding Products and Categories
  Admins can add products and adjust stock levels.
  Admins can add categories. 

## Screenshots

!["Home Paage"](https://github.com/jregan95/jungle/blob/master/docs/jungle2.png)
!["Cart"](https://github.com/jregan95/jungle/blob/master/docs/jungle1.png)
## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing
For testing success scenarios, use Credit Card # 4111 1111 1111 1111. More details in Stripe Testing Docs.

## Dependencies
Rails 6.1 Rails Guide
Bootstrap 5
PostgreSQL 9.x
Stripe
Visit Stripe Docs for more information.
