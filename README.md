# README

## Project info

* Ruby version: 2.6.3

* Rails version: 6.0.2

## Project stack

* DB: PostgreSQL

* Frontend: HTML, CSS, Bootstrap, JavaScript, jQuery

* Backend: Ruby on Rails

## Pre-requisites

* PostgreSQL - [Download page](https://www.postgresql.org/download/)

* yarn - [Install guide](https://classic.yarnpkg.com/en/docs/install/#mac-stable)

* ruby - [Install guide](https://www.ruby-lang.org/es/documentation/installation/)

* Rails - [Install guide](https://www.tutorialspoint.com/ruby-on-rails/rails-installation.htm)

## Project setup

* Clone repository
```
git clone https://github.com/DanielSuarezCaceres/nutrain.git
```
* Configure local_env.yml
```
cd nutrain
touch app/config/local_env.yml
```
and copy your PostgreSQL credentials
```
# DDBB DEVELOP

DB_USER_NAME: your_postgres_user
DB_PASSWORD: your_postgres_password

# MAIL_DEVELOP

MAIL_USER_NAME_DEVELOP: gmail_address
MAIL_PASSWORD_DEVELOP: gmail_password
```
* Install gems
```
bundle install
```
* Webpacker
```
rails webpacker:install
```
* Check packages are updated
```
yarn install --check-files
```
* Setup database and seed if wanted
```
rails db:drop db:create db:migrate db:seed
```
* Start up server
```
rails s
```
and go to ```localhost:3000```. If everything went ok, you should be seeing login page.
