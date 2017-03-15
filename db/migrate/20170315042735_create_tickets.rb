class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.references :ticket_type, foreign_key: true
      t.integer :buyer_id
      t.integer :quantity

      t.timestamps
    end
  end
end
