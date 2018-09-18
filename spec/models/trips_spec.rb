require 'rails_helper' 

describe Trip, type: :model do 
  describe 'validations' do 
    it { should validate_presence_of :name}
    it { should validate_presence_of :start_date}
    it { should validate_presence_of :end_date}
  end 
  
  describe 'Relationships' do 
    it { should have_many :trip_trails}
    it { should have_many :trails}
  end 
  
  describe 'Class Methods' do 
    it 'should calculate total length of all trails for a trip' do
      trip = Trip.create!(name: 'Trip 1', start_date: '2018-12-14', end_date: '2018-12-15')
      trail_1 = trip.trails.create!(length: 10, name: 'Trail 1', address: 'Address 1')
      trail_2 = trip.trails.create!(length: 10, name: 'Trail 2', address: 'Address 2')
      
      expected = 20
      actaul = trip.total_length
      
      expect(actaul).to eq(expected)
    end
    
    it 'should calculate average length of all trails for a trip' do
      trip = Trip.create!(name: 'Trip 1', start_date: '2018-12-14', end_date: '2018-12-15')
      trail_1 = trip.trails.create!(length: 4, name: 'Trail 1', address: 'Address 1')
      trail_2 = trip.trails.create!(length: 6, name: 'Trail 2', address: 'Address 2')
      
      expected = 5
      actaul = trip.average_length
      
      expect(actaul).to eq(expected)
    end
    
    it 'should return the longest trail for a trip' do
      trip = Trip.create!(name: 'Trip 1', start_date: '2018-12-14', end_date: '2018-12-15')
      trail_1 = trip.trails.create!(length: 4, name: 'Trail 1', address: 'Address 1')
      trail_2 = trip.trails.create!(length: 6, name: 'Trail 2', address: 'Address 2')
      trail_3 = trip.trails.create!(length: 10, name: 'Trail 3', address: 'Address 3')
      
      expected = trail_3.name
      actaul = trip.longest_trail
      
      expect(actaul).to eq(expected)
      
    end
    
    it 'should return the shortest trail for a trip' do
      trip = Trip.create!(name: 'Trip 1', start_date: '2018-12-14', end_date: '2018-12-15')
      trail_1 = trip.trails.create!(length: 4, name: 'Trail 1', address: 'Address 1')
      trail_2 = trip.trails.create!(length: 6, name: 'Trail 2', address: 'Address 2')
      trail_3 = trip.trails.create!(length: 10, name: 'Trail 3', address: 'Address 3')
      
      expected = trail_1.name
      actaul = trip.shortest_trail
      
      expect(actaul).to eq(expected)
    end
  end
end 