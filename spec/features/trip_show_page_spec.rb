require "rails_helper"

RSpec.describe 'as a visitor', type: :feature do

  before :each do
    @trip = Trip.create(name: 'trip')

    @trip.trails.create!(length: 100, name: 'trail 1', address: 'place 1')
    @trip.trails.create!(length: 200, name: 'trail 2', address: 'place 2')
    @trip.trails.create!(length: 300, name: 'trail 3', address: 'place 3')

    visit trip_path(@trip)
  end

  it 'sees all trails included in the trip as links' do
    @trip.trails.each do |trail|
      expect(page).to have_link(trail.name)
      expect(page).to have_content(trail.length)
      expect(page).to have_content(trail.address)
    end
  end

  it 'clicks a trail name and goes to its show page' do
    trail = @trip.trails.first
    click_link(trail.name)

    expect(current_path).to eq(trail_path(trail))
    expect(page).to have_content(trail.name)
    expect(page).to have_content(trail.address)
  end

  it 'sees average and total length of trails' do
    expect(page).to have_content('Total Trail Length: 600')
    expect(page).to have_content('Average Trail Length: 200')
  end

  it 'sees the max and min length of trails' do
    expect(page).to have_content('Longest Trail: trail 3, Length: 300')
    expect(page).to have_content('Shortest Trail: trail 1, Length: 100')

  end

end
