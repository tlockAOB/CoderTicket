class EventsController < ApplicationController

  before_filter :require_permission, only: [:edit, :update]

  def require_permission
    @event = Event.find(params[:id].to_i)
    unless current_user.id == @event.creator_id
      flash[:danger] = "You can only edit events that you created"
      redirect_to your_events_path
    end
  end

  def index
    if params[:search]
      @events = Event.search(params[:search]).order("starts_at ASC")
    else
      @events = Event.published.upcoming
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

  def edit
    #defined in before_action ~~ @event = Event.find(params[:id].to_i)
  end

  def update
    #defined in before_action ~~ @event = Event.find(params[:id].to_i)
    if @event.update(event_params)
      flash[:success] = "Event updated successfully"
      redirect_to your_events_path
    else
      flash.now[:danger] = "Error: #{@event.errors.full_messages.to_sentence}"
      render :edit
    end
  end

  def mine
    @events = Event.where(creator_id: current_user.id)
  end

  def mark_as_published
    @event = Event.find(params[:id])
    @event.published_at = Time.now
    if @event.save
      flash[:success] = "Your event '#{@event.name}' was published successfully"
      redirect_to your_events_path
    else
      flash[:error] = "Error: #{@event.errors.full_messages.to_sentence}"
      redirect_to your_events_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:creator_id, :extended_html_description, :venue_id, :category_id, :starts_at, :ends_at, :name, :hero_image_url)
  end

end
