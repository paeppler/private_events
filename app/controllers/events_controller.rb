class EventsController < ApplicationController
  before_action :get_events, only: [:index]

  def index
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to @event
    else 
      render 'new'
    end
  end


  private

  def get_events
    @events = Event.all
  end

  def event_params
    params.require(:event).permit(:name, :location, :date)
  end
end
