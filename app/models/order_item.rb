class OrderItem < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :order

  validates :ticket_type, :order, presence: true
end
