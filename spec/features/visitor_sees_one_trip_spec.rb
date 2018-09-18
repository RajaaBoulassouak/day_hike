require 'rails_helper'

describe "Visitor visits one hiking trip's page" do
  # it 'they link from the index page' do
  #   trip_1 = Trip.create!(name: 'Trip 1', start_date: '2018-12-14', end_date: '2018-12-15')
  #   trip_2 = Trip.create!(name: 'Trip 2', start_date: '2018-12-14', end_date: '2018-12-15')
  # 
  #   visit trips_path 
  #   click_on 'Trip 1'
  # 
  #   expect(current_path).to eq(trip_path(trip_1))
  #   expect(page).to have_content(trip_1.name)
  # end 
  
  describe 'Visitor see a hiking trip' do
    it 'they link from the index page' do
      trip = Trip.create!(name: 'Trip 1', start_date: '2018-12-14', end_date: '2018-12-15')
      trail_1 = trip.trails.create!(length: 4, name: 'Trail 1', address: 'Address 1')
      trail_2 = trip.trails.create!(length: 6, name: 'Trail 2', address: 'Address 2')
      trail_3 = trip.trails.create!(length: 10, name: 'Trail 3', address: 'Address 3')
  
      visit trip_path(trip)

      expect(page).to have_content("Length: #{trail_1.length}")
      expect(page).to have_content(trail_1.name)
      expect(page).to have_content(trail_1.address)
      expect(page).to have_content("Length: #{trail_2.length}")
      expect(page).to have_content(trail_2.name)
      expect(page).to have_content(trail_2.address)
      expect(page).to have_content("Total Trail Length: #{trip.total_length}")
      expect(page).to have_content("Average Trail Length: #{trip.average_length}")
      expect(page).to have_content("Longest Trail: #{trip.longest_trail}")
      expect(page).to have_content("Shortest Trail: #{trip.shortest_trail}")
    end 
  end 
end 