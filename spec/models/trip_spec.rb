require 'rails_helper'

RSpec.describe Trip, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should have_many :trails}
  end

  describe 'instance methods' do

    before :each do
      @trip = Trip.create(name: 'trip')

      @trip.trails.create!(length: 100, name: 'trail 1', address: 'place 1')
      @trip.trails.create!(length: 200, name: 'trail 2', address: 'place 2')
      @trip.trails.create!(length: 300, name: 'trail 3', address: 'place 3')
    end

    it '#total_trail_length' do
      expected = 600
      actual = @trip.total_trail_length

      expect(actual).to eq(expected)
    end

    it '#avg_trail_length' do
      expected = 200
      actual = @trip.avg_trail_length

      expect(actual).to eq(expected)
    end

    it '#longest_trail' do
      expected = @trip.trails.last
      actual = @trip.longest_trail

      expect(actual).to eq(expected)
    end

    it '#shortest_trail' do
      expected = @trip.trails.first
      actual = @trip.shortest_trail

      expect(actual).to eq(expected)
    end
  end

end
