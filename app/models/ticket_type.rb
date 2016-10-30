class TicketType < ActiveRecord::Base
  belongs_to :event
  has_many :order_items

  validates :name, length: { maximum: 30 }
  validates :price, presence: true

  def total_items
    order_items.map{ |e| e.quantity }.sum
  end

  def remain_tickets
  	max_quantity - total_items
  end

  def enough_quantity?(quantity)
  	remain_tickets - quantity < 0 ? false : true
  end

end
