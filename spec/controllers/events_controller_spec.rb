require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe "get #index" do
    it "responds successfully with http 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    # it "loads events" do
    #   event = Event.new
    #   event.save(validate: false)
    #   get :index
    #   get(assigns(:events)).to eq [event]
    # end

  end
end
