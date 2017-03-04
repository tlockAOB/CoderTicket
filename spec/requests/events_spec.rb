require 'rails_helper'

RSpec.describe "Events", type: :request do

  describe "GET /upcoming" do

    it "displays upcoming events on /upcoming page" do
      a = Event.new(starts_at: 1.day.from_now, name: 'Future')
      b = Event.new(starts_at: 365.days.ago, name: 'Past' )

      a.save(validate:false)
      b.save(validate:false)

      get '/upcoming'
      expect(response).to have_http_status(200)
      expect(response.body).to include "Future"
      expect(response.body).to_not include "Past"
    end
  end

  # describe "GET /events" do
  #   it "accepts search on the homepage" do
  #     a = Event.create!(name: "Dam Vinh Hung's concert", starts_at: 2.days.ago, ends_at: 1.day.ago, extended_html_description: "a past event",
  #                   venue: Venue.new, category: Category.new)
  #     b = Event.create!(name: "Scorpion in Vietnam", starts_at: 2.days.ago, ends_at: 1.day.from_now, extended_html_description: " a future event",
  #                   venue: Venue.new, category: Category.new)

  #     get root_path(search: "Scorpion")
  #     expect(response).to have_http_status(200)
  #     expect(response.body).to include "Scorpion in Vietnam"
  #     expect(response.body).to_not include "Dam Vinh Hung"
  #   end
  # end
end
