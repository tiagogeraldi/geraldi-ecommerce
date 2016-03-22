# geraldi-ecommerce

Simple and generic e-commerce for general uses.

## Setting up the project
**Dependencies**

* Ruby 2.2.3
* PostgresSQL
* Slim

## Database
```
  mv config/database.yml.example config/database.yml
```
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

## Testing
```
bundle exec rspec
```

## Production
Needed ENV variables:
```
SITE_NAME
ADMIN_EMAIL

# SMTP
SMTP_SERVER
DOMAIN_NAME
EMAIL_PROVIDER_USERNAME
EMAIL_PROVIDER_PASSWORD
SMTP_EMAIL_SENDER

# S3 storage
S3_BUCKET
S3_ACCESS_KEY_ID
S3_SECRET_ACCESS_KEY

# Pagseguro checkout
PAGSEGURO_TOKEN
PAGSEGURO_EMAIL
```
