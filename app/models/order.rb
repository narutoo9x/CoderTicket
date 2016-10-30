class Order < ApplicationRecord
	validates :user, presence: true

	has_many :order_items, dependent: :destroy
	belongs_to :user

	def self.last_pending
		where(confirm_at: nil).last
	end

	def total_quantity
		order_items.map{ |e| e.quantity }.sum
	end

	def total
		order_items.map{ |e| e.ticket_type.price * e.quantity }.sum
	end

end
