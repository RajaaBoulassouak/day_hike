require 'rails_helper'

describe Trail, type: :model do
  describe 'validations' do
    it { should validate_presence_of :length }
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }

    it { should validate_numericality_of(:length).only_integer }
    it { should validate_numericality_of(:length).is_greater_than(0) }
  end
  
  describe 'Relationships' do 
    it { should have_many :trip_trails}
    it { should have_many :trips}
  end
  
  describe 'Class Methods' do 
    it 'should count total trips of that include a trail' do
      trail = Trail.create!(length: 10, name: 'Trail 2', address: 'Address 2')
      trip_1 = trail.trips.create!(name: 'Trip 1', start_date: '2018-12-14', end_date: '2018-12-15')
      trip_2 = trail.trips.create!(name: 'Trip 2', start_date: '2018-12-14', end_date: '2018-12-15') 
      
      expected = 2
      actual = trail.trip_count
      
      expect(expected).to eq(actual)
    end
  end
end
