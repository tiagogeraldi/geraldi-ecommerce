class OrderStatus < EnumerateIt::Base
  associate_values :created, :paid, :processing, :sent, :finished
end
