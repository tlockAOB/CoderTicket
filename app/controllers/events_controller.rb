class EventsController < ApplicationController
  def index
    if params[:search]
      @events = Event.search(params[:search]).order("starts_at ASC")
    else
      @events = Event.upcoming
    end
  end

  def show
    @event = Event.find(params[:id].to_i)
  end
end
