class ChangeOrderUserToCustomers < ActiveRecord::Migration
  def change
    remove_column :orders, :user_id

    change_table :orders do |t|
      t.references :customer, index: true, foreign_key: true
    end
  end
end
