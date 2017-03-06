require 'rails_helper'

RSpec.describe Venue, type: :model do

  describe 'simple model presence tests' do

    it "returns [] when there are no venues" do
      expect(Venue.all).to eq []
    end

    it "returns an array of venues" do
      venue_one = Venue.new id: 1, name: "One"
      venue_two = Venue.new id: 2, name: "Two"

      venue_one.save(validate: false)
      venue_two.save(validate: false)

      expect(Venue.all).to match_array [venue_one, venue_two]
    end

  end

end
