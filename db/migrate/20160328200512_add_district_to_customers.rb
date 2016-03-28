class AddDistrictToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :district, :string
    add_column :customers, :address_number, :string
  end
end
