ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'
require 'capybara-screenshot/rspec'
require 'capybara/poltergeist'
require 'database_cleaner'

require 'simplecov'
SimpleCov.start do
  add_group "app", "app"
end

Capybara.app_host = "http://localhost:3001"
Capybara.server_host = "localhost"
Capybara.server_port = "3001"

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include FactoryGirl::Syntax::Methods
  
  config.before(:each) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
    DatabaseCleaner.clean

    load Rails.root + "db/seeds.rb"
  end
end

Capybara.default_driver = :poltergeist
Capybara.default_selector = :css
Capybara.javascript_driver = :poltergeist

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, timeout: 600, js_errors: false)
end