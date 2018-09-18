require 'rails_helper'

describe 'Visitor visits hiking trips index page' do
  it 'they a list of all hiking trip names' do 
    trip_1 = Trip.create!(name: 'Trip 1', start_date: '2018-12-14', end_date: '2018-12-15')
    trip_2 = Trip.create!(name: 'Trip 2', start_date: '2018-12-14', end_date: '2018-12-15')
    
    visit trips_path 
    
    expect(page).to have_content(trip_1.name)
    expect(page).to have_content(trip_2.name)
  end 
end