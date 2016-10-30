class TicketTypesController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @type = TicketType.new(event: @event)
  end

  def create
    @type = TicketType.new ticket_params
    if @type.save
      flash[:sucess] = "Create #{@type.name} sucessfully."
      redirect_to event_path(@type.event_id)
    else
      flash[:error] = @type.errors.messages.to_sentence
      render :new
  	end
  end

  private

  	def ticket_params
  		params.require(:ticket_type).permit(:name, :price, :max_quantity, :event_id)
  	end
end
