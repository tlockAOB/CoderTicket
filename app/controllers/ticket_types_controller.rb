class TicketTypesController < ApplicationController
  def new
    @ticket_type = TicketType.new
    @event = Event.find(params[:event_id])
  end

  def create
    @ticket_type = TicketType.new ticket_type_params
    @event = Event.find(params[:event_id])
    @ticket_type.event_id = @event.id
    @ticket_type.quantity_remaining = @ticket_type.max_quantity

    if @ticket_type.save
      flash[:success] = "Ticket Type added"
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  private

    def ticket_type_params
      params.require(:ticket_type).permit( :name, :price, :max_quantity)
    end
end
