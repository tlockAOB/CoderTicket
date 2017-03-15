class TicketsController < ApplicationController

  before_filter :check_remaining, only: [:create]

  def check_remaining
    @event = Event.find(params[:event_id].to_i)
    @ticket = Ticket.new ticket_params
    @ticket_type = TicketType.find(@ticket.ticket_type_id)

    unless @ticket.quantity <= @ticket_type.quantity_remaining
      flash[:danger] = "Sorry, you've exceeded the number of remaining tickets. Try again. You can see the number reamining in the sidebar"
      redirect_to event_path(@event)
    end
  end

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
      @ticket_type = TicketType.find(@ticket.ticket_type_id)
      @ticket_type.quantity_remaining = @ticket_type.quantity_remaining - @ticket.quantity
      @ticket_type.save!

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
