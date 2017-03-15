class AddPurchasedQuantityToTicketTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :ticket_types, :purchased_quantity, :integer
  end
end
