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

  def new
    @event = Event.new
  end

  def create
   @event = Event.new event_params
    if @event.save
      flash[:success] = "Event Created, Ready for publish"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def mine
    @events = Event.find_by_creator_id(current_user.id)
  end

  private

  def event_params
    params.require(:event).permit(:creator_id, :extended_html_description, :venue_id, :category_id, :starts_at, :ends_at, :name)
  end

end
