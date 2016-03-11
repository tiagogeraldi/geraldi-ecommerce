FactoryGirl.define do
  factory :cart do
    product
    quantity 100
    session_id 'aaaaaaaaaaa'
  end
end
