class SetQuantityRemainingValues < ActiveRecord::Migration[5.0]
  def self.up
    TicketType.update_all("quantity_remaining=max_quantity")
  end

  def self.down
  end
end
