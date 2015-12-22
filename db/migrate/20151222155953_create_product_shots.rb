class CreateProductShots < ActiveRecord::Migration
  def change
    create_table :product_shots do |t|
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
