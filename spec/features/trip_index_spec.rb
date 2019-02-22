require 'rails_helper'

RSpec.describe 'as a visitor' do

  before :each do
    @trip_1 = Trip.create(name: 'trip 1')
    @trip_2 = Trip.create(name: 'trip 2')
    @trip_3 = Trip.create(name: 'trip 3')
    visit trips_path
  end
  it 'sees all trips as links' do
    expect(page).to have_link(@trip_1.name)
    expect(page).to have_link(@trip_2.name)
    expect(page).to have_link(@trip_3.name)
  end

  it 'can click a trip and link to a show page' do
    click_link(@trip_1.name)
    
    expect(current_path).to eq(trip_path(@trip_1))
    expect(page).to have_content(@trip_1.name)
  end

end
