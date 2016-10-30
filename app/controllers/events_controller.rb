class EventsController < ApplicationController
  before_action :set_event, only: [:publish, :show, :edit, :update]

  def index
  	if params[:search]
	    @events = Event.published.search(params[:search]).order("ends_at DESC")
	  else
	  	@events = Event.published.upcoming.order("ends_at DESC")
	  end
  end

  def publish
    if @event.un_published?
      @event.mark_as_published!
      render :show
    else
      redirect_to :back, flash: {error: "Event has already been published."}
    end
  end

  def show
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

  def edit
  end

  def update
    if @event.update event_params
      flash[:sucess] = "Update events successfully."
      redirect_to @event
    else
      flash[:error] = @event.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

    def set_event
      @event = Event.find params[:id]
    end

    def event_params
      params.require(:event).permit(:starts_at, :ends_at, :hero_image_url, :extended_html_description,
                                    :name, :category_id, :venue_id, :event_id, :user_id)
    end
end
