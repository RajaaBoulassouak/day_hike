class Trip < ApplicationRecord
  validates_presence_of :name, :start_date, :end_date
  
  has_many :trip_trails
  has_many :trails, through: :trip_trails
  
  def total_length 
    trails.sum(:length)
  end
  
  def average_length 
    trails.average(:length)
  end
  
  def longest_trail 
    trails.order(length: :desc).first.name
  end 
  
  def shortest_trail
    trails.order(:length).first.name
  end
end
