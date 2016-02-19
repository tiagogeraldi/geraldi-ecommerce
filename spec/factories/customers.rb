FactoryGirl.define do
  factory :customer do
    name                  'First customer'
    email                 'customer@test.com'
    password              '123123'
    password_confirmation '123123'
  end
end
