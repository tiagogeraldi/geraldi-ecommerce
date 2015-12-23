class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
    	 t.integer :user_id
    	 t.string	:name
    	 t.string :address
    	 t.string :city
    	 t.string :state
    	 t.string	:zip_code
    	 t.string	:phone
    end

    add_foreign_key :customers, :users
  	add_index :customers, :user_id	
  end
end
