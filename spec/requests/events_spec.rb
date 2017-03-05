require 'rails_helper'

RSpec.describe "Events", type: :request do

  describe "Homepage returns events of proper scope" do

    it "displays upcoming events on /event page" do
      a = Event.new(starts_at: 1.day.from_now, name: 'Future')
      b = Event.new(starts_at: 365.days.ago, name: 'Past' )

      a.save(validate:false)
      b.save(validate:false)

      get events_path
      expect(response).to have_http_status(200)
      expect(response.body).to include "Future"
      expect(response.body).to_not include "Past"
    end

    it "accepts search on the homepage" do
      get events_path(search: "TLock is the best")
      expect(response).to have_http_status(200)
    end

    it "displays searched events on homepage, regardless of Case, but only if upcoming" do
      a = Event.create!(name: "Tlock's BIG CaPiTaLiZeD Event", starts_at: 2.days.from_now, ends_at: 4.days.from_now, extended_html_description: "a future event",
                    venue: Venue.new, category: Category.new)
      b = Event.create!(name: "Keyword Not Here", starts_at: 2.days.from_now, ends_at: 4.days.from_now, extended_html_description: "another future event",
                    venue: Venue.new, category: Category.new)
      c = Event.create!(name: "Blast from capitalized Past", starts_at: 2.days.ago, ends_at: 1.day.ago, extended_html_description: " a past event",
                    venue: Venue.new, category: Category.new)

      get events_path(search: "capitalized")
      expect(response.body).to include "CaPiTaLiZeD"
      expect(response.body).to_not include "Keyword Not Here"
      expect(response.body).to_not include "Blast from capitalized Past"
    end

  end

end
