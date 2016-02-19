FactoryGirl.define do
  factory :product do
    category
    brand
    price        50
    height       10
    width        10
    depth        10
    weight       20
    factory_code 'AAA123'
    stock_code   '050-010'
    name         'sneakers'
  end
end
