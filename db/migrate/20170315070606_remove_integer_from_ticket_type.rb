class RemoveIntegerFromTicketType < ActiveRecord::Migration[5.0]
  def change
    remove_column :ticket_types, :integer, :string
  end
end
