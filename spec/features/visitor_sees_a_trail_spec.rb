require 'rails_helper' 

describe 'Visitor visits a trail page' do
  it 'they a link from the trip page' do
    trip = Trip.create!(name: 'Trip 1', start_date: '2018-12-14', end_date: '2018-12-15')
    trail = trip.trails.create!(length: 4, name: 'Trail 1', address: 'Address 1')
    
    visit trip_path(trip)
    click_on trail.name 

    expect(current_path).to eq(trail_path(trail))
    expect(page).to have_content(trail.name)
  end 
  
  it 'Shows all trips that include the trail' do 
    trail = Trail.create!(length: 10, name: 'Trail 2', address: 'Address 2')
    trip_1 = trail.trips.create!(name: 'Trip 1', start_date: '2018-12-14', end_date: '2018-12-15')
    trip_2 = trail.trips.create!(name: 'Trip 2', start_date: '2018-12-14', end_date: '2018-12-15') 
    
    visit trail_path(trail) 
    
    expect(page).to have_content(trip_1.name)
    expect(page).to have_content(trip_2.name)
    expect(page).to have_content(trail.trip_count)
  end
end 