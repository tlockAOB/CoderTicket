require 'rails_helper'

RSpec.describe "routing to /upcoming", type: 'routing' do

  it "/upcoming routes to events#index" do
    expect(get: '/upcoming').to route_to(controller: 'events', action: 'index')
  end

end
