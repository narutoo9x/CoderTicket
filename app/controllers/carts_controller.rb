class CartsController < ApplicationController

  def index
  	@order = current_order
  end

  def show
  	@last_order = Order.last
  end

  def confirm
  	@order = current_order
  	@order.confirm_at = Time.now
  	if @order.update order_params
  		flash[:success] = 'Order successfully.'
  		redirect_to carts_show_path
  	else
  		flash[:error] = "Can't order ticket right now."
  		render :index
  	end
  end

  private

  	def order_params
  		params.require(:order).permit(:user_id, :discount_code)
  	end

end
