require 'rails_helper'

RSpec.describe Event, type: :model do

  pending "test past events"

  describe ".upcoming" do

    it "returns [] when there are no events" do
      expect(Event.upcoming).to eq []
    end

    it "returns 1 event when there is one event" do
      event = Event.new starts_at: 1.day.from_now
      event.save(validate: false)
      expect(Event.upcoming).to eq [event]
    end

    it "returns only upcoming events" do
      a = Event.new starts_at: 1.day.ago
      b = Event.new starts_at: 1.day.from_now
      c = Event.new starts_at: Date.parse("2099/12/1")

      a.save(validate: false)
      b.save(validate: false)
      c.save(validate: false)

      expect(Event.upcoming).to match_array [c, b]
    end

    it "returns [] when all events are in the past events" do
      a = Event.new starts_at: 1.day.ago
      b = Event.new starts_at: 2.days.ago
      c = Event.new starts_at: Date.parse("1987/7/10")

      a.save(validate: false)
      b.save(validate: false)
      c.save(validate: false)

      expect(Event.upcoming).to match_array []
    end

  end

  describe "#venue_name" do

    it "returns nil if there's no value" do
      event = Event.new
      event.save(validate: false)
      expect(event.venue_name).to eq nil
    end

    it "returns venue name" do
      venue = Venue.new name: "GEM Center"
      event = Event.new venue: venue

      expect(event.venue_name).to eq "GEM Center"
    end

  end
end
