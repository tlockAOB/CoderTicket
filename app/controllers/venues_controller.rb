class VenuesController < ApplicationController

  def new
    @venue = Venue.new
  end

  def create
   @venue = Venue.new venue_params
    if @venue.save
      flash[:success] = "Venue Created, Ready for events"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :region_id, :full_address)
  end

end
