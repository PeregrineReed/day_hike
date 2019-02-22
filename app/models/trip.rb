class Trip < ApplicationRecord
  validates_presence_of :name
  has_many :trip_trails
  has_many :trails, through: :trip_trails

  def total_trail_length
    trails.sum(:length)
  end

  def avg_trail_length
    trails.average(:length)
  end

  def longest_trail
    trails.find_by(length: trails.maximum(:length))
  end

  def shortest_trail
    trails.find_by(length: trails.minimum(:length))
  end


end
