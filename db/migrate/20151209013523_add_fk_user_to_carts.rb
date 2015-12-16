class AddFkUserToCarts < ActiveRecord::Migration
  def change
  	add_foreign_key :carts, :users

  	add_index :carts, :user_id
  end
end
