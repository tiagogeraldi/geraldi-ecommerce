class OrderStatus < EnumerateIt::Base
  associate_values :created, :processing, :sent, :finished
end
