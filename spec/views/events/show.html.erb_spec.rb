require 'rails_helper'

RSpec.describe "events/show", type: :view do

  pending it "Displays the event title in h3.event-name" do
    event = Event.create!(name: "Burning Man", starts_at: 2.days.from_now, ends_at: 4.days.from_now, extended_html_description: " a past event",
                          venue: Venue.new, category: Category.new)

    ticket_type = TicketType.create!(event_id: event.id, price: 99000, name: "Secret", max_quantity: 1000)

    assign(:event, [event])
    assign(:event.ticket_types, [ticket_type])
    render
    expect(rendered).to include('<h3 class="event-name">Burning Man</h3>')
  end

end


