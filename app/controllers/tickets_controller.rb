class TicketsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find params[:event_id]
    if !@event.is_out_of_date?
      quantity = params[:ticket_quantity]
      @order = Order.new(user: current_user)
      quantity.each do |ticket_type_id, quantity|
        ticket_type = TicketType.find(ticket_type_id)
        order_item = OrderItem.new(ticket_type_id: ticket_type_id, quantity: quantity)
        unless ticket_type.enough_quantity? order_item.quantity
          flash[:error] = "Only #{ticket_type.remain_tickets} tickets left."
          redirect_to new_event_ticket_path
          return
        end
        @order.order_items << order_item
      end

      if @order.save
        flash[:success] = "Ordered #{@order.total_quantity} tickets, total price #{@order.total} VND."
        redirect_to root_path
      else
        flash[:error] = @order.errors.full_messages.to_sentence
        redirect_to new_event_ticket_path
      end
    else
      flash[:error] = "Can't book! Event is closed."
      redirect_to root_path
    end
  end
end
