class Ticket < ApplicationRecord
  belongs_to :ticket_type

  validates :quantity, :ticket_type_id, presence: true
  validates :quantity, :numericality => { :greater_than => 0, :less_than_or_equal_to => 10 }
end
