# geraldi-ecommerce

Simple and generic e-commerce for general uses.

## Setting up the project
**Dependencies**

* Ruby 2.2.3
* PostgresSQL
* Slim

## Database
Setup your PostgreSQL connection at config/database.yml

## Install
```shell
bundle install

rake db:create
rake db:migrate
rake db:seed
```

## Running
```shell
puma -p 8080
```

### Front-end
http://localhost:8080

### Back-end
http://localhost:8080/admin
Email: test@test.com
Password: 123123
