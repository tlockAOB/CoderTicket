class TicketsController < ApplicationController
  def index
  end

  def new
    @event = Event.find(params[:event_id].to_i)
    @ticket_types = @event.ticket_types
    @ticket = Ticket.new
  end

  def create
    @event = Event.find(params[:event_id].to_i)
    @ticket_types = @event.ticket_types
    @ticket = Ticket.create ticket_params

    if @ticket.save
      flash[:success] = "Tickets ordered on your account. You will be invoiced shortly."
      redirect_to your_tickets_path
    else
      render 'new'
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:quantity, :ticket_type_id)
  end
end
