class OrderItemsController < ApplicationController

	def create
		@order_item = OrderItem.create order_item_params
		@order_item.order = current_order
		if @order_item.save
			redirect_to root_path
		else
			raise "cannot add to order. #{@order_item.eroors.messages.tosentence}"
		end
	end

	private
		def order_item_params
			params.require(:order_item).permit(:quantity, :ticket_type_id)
		end
end
