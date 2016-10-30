class Order < ApplicationRecord
	validates :user, presence: true

	has_many :order_items, dependent: :destroy
	belongs_to :user

	def self.last_pending
		where(confirm_at: nil).last
	end

	def amount
		order_items.map{ |e| e.ticket_type.price * e.quantity }.sum
	end

	def discount_amount
		discount_code == 'CODERSCHOOL' ? 100 : 0
	end

end
