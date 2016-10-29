class EventsController < ApplicationController
  def index
  	if params[:search]
	    @events = Event.search(params[:search]).order("ends_at DESC")
	  else
	  	@events = Event.upcoming.order("ends_at DESC")
	  end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
  end

  def create
    @event = Event.new event_params
    if @event.save
      flash[:success] = 'Create event successfully.'
      redirect_to evnet_path(@event)
    else
      flash.now[:error] = 'Error: can not create an event.'
      render :new
    end
  end

  private

    def event_params
      params.require(:event).permit(:starts_at, :ends_at, :extended_html_description, :name, :category_id, :venue_id)
    end
end
