class CreateShippings < ActiveRecord::Migration
  def change
    create_table :shippings do |t|
      t.float :quantity
      t.string :tracking_code

      t.timestamps null: false
    end
  end
end
