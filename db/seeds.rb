# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.find_or_create_by!(email: 'test@test.com') do |user|
  user.password              = '123123'
  user.password_confirmation = '123123'
  user.confirm!
end
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

Setting.create name: 'facebook', description: 'https://www.facebook.com'
Setting.create name: 'twitter', description: ''
Setting.create name: 'google-plus', description: ''
Setting.create name: 'email-contact', description: ''
Setting.create name: 'phone', description: ''
Setting.create name: 'phone2', description: ''
Setting.create name: 'address', description: ''
Setting.create name: 'keywords', description: ''
