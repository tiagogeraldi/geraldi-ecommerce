class AddSentToCustomer < ActiveRecord::Migration
  def change
    add_column :shippings, :sent_to_user, :boolean, default: false
  end
end
