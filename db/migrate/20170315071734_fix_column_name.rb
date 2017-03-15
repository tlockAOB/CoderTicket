class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :ticket_types, :purchased_quantity, :quantity_remaining
  end
end
