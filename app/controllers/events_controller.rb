class EventsController < ApplicationController
  before_action :get_events, only: [:index]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to @event
    else 
      render 'new'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_url, status: :see_other, alert: "Event sucessfully deleted!"
  end


  private

  def get_events
    @events = Event.all
  end

  def event_params
    params.require(:event).permit(:name, :location, :date)
  end
end
