class AddFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :category_id, :integer
    add_column :products, :brand_id, :integer
    add_column :products, :discount, :float
    add_column :products, :news, :boolean, default: false
    add_column :products, :views, :integer, default: 0
    add_column :products, :special, :boolean, default: false
    add_column :products, :promotion, :boolean, default: false
    add_column :products, :sould_out, :boolean, default: false
    add_column :products, :stock_code, :string
    add_column :products, :factory_code, :string

    add_foreign_key :products, :categories
    add_foreign_key :products, :brands

    add_index :products, :category_id
    add_index :products, :brand_id
  end
end
