require 'rails_helper'

RSpec.describe "events routing", type: 'routing' do

  it "/events routes to events#index" do
    expect(get: '/events').to route_to(controller: 'events', action: 'index')
  end

  it "events_path routes to events#index" do
    expect(get: events_path).to route_to(controller: 'events', action: 'index')
  end

  it "events_path with search routes to events#index" do
    expect(get: events_path(search: 'Something')).to route_to(controller: 'events', action: 'index', search: 'Something')
  end

end
