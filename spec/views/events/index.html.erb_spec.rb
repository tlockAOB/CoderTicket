require 'rails_helper'

RSpec.describe "events/index", type: :view do
  it "renders Discover upcoming events in a header tag" do
    assign(:events, [])
    render
    # if you want to see the whole rendered text, use 'puts rendered'
    expect(rendered).to include("<h2>Discover upcoming events</h2>")
  end

  it "Displays an event title in h4.card-title" do
    event = Event.create!(name: "Burning Man", starts_at: 2.days.from_now, ends_at: 4.days.from_now, extended_html_description: " a past event",
                          venue: Venue.new, category: Category.new)
    ticket_type = TicketType.create!(name: "secret ticket", event_id: event.id)
    assign(:events, [event])
    render
    expect(rendered).to include('<h4 class="card-title">Burning Man</h4>')
  end
end
