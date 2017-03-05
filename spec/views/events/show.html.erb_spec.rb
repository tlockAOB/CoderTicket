require 'rails_helper'

RSpec.describe "events/show", type: :view do

  it "Displays the event title in h3.event-name" do
    event = Event.create!(name: "Burning Man", starts_at: 2.days.from_now, ends_at: 4.days.from_now, extended_html_description: " a past event",
                          venue: Venue.new, category: Category.new)
    event.ticket_type = [8]
    assign(:event, [event])
    render
    expect(rendered).to include('<h4 class="event-name">Burning Man</h3>')
  end

end


