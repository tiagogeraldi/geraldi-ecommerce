class AddCustomerTimestamps < ActiveRecord::Migration
  def change
    change_table :customers do |t|
      t.timestamps
    end
  end
end
