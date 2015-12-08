# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

Setting.create name: 'facebook', description: 'https://www.facebook.com'
Setting.create name: 'whatsapp', description: ''
Setting.create name: 'twitter', description: ''
Setting.create name: 'google-plus', description: ''
Setting.create name: 'email-contato', description: 'contato@areagt.com'
Setting.create name: 'telefone', description: ''
Setting.create name: 'telefone2', description: ''
Setting.create name: 'address', description: ''
Setting.create name: 'keywords', description: 'Auto peças, reparo, carros, mecânica, acessório, e-commerce, online, comprar'
