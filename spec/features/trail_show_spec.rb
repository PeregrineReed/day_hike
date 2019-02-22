require "rails_helper"

RSpec.describe 'as a visitor', type: :feature do

  before :each do
    @trail = Trail.create!(length: 300, name: 'trail 3', address: 'place 3')

    @trail.trips.create!(name: 'trip 1')
    @trail.trips.create!(name: 'trip 2')
    @trail.trips.create!(name: 'trip 3')

    visit trail_path(@trail)
  end

  it 'sees nameand total length of all trips trail is on' do
    @trail.trips.each do |trip|
      expect(page).to have_content(trip.name)
      expect(page).to have_content("Total Trip Length: #{trip.total_trail_length}")
    end
  end

end
