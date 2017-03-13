class TicketsController < ApplicationController
  def index
  end

  def new
    @event = Event.find(params[:event_id].to_i)
    @ticket = Ticket.new ##need model
  end

  def create
    @event = Event.find(params[:event_id].to_i)
  end

  private

  def ticket_params
    params.require(:ticket).permit(:quantity, :ticket_type_id)
  end
end
