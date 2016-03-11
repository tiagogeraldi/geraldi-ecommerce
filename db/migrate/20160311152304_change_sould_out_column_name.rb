class ChangeSouldOutColumnName < ActiveRecord::Migration
  def change
    rename_column :products, :sould_out, :sold_out
  end
end
