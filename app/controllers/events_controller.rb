class EventsController < ApplicationController
  def index
  	if params[:search]
	    @events = Event.published.search(params[:search]).order("ends_at DESC")
	  else
	  	@events = Event.published.upcoming.order("ends_at DESC")
	  end
  end

  def publish
    @event = Event.find(params[:id])
    if @event.un_published?
      @event.mark_as_published!
    else
      redirect_to :back, flash: {error: "Event has already been published."}
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new event_params
    @event.user = current_user
    if @event.save
      flash[:success] = 'Create event successfully.'
      redirect_to root_path
    else
      flash.now[:error] = 'Error: can not create an event.'
      render :new
    end
  end

  private

    def event_params
      params.require(:event).permit(:starts_at, :ends_at, :extended_html_description, :name, :category_id, :venue_id, :event_id, :user_id)
    end
end
