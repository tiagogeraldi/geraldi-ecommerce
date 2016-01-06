class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true
      t.string :status
      t.string :shipping_cost

      t.timestamps null: false
    end
  end
end
