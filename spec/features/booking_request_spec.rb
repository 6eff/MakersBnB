feature 'New Booking Request' do

  before :each do
    Space.create(name: 'The White House',
                 address: '1600 Pennsylvania Avenue',
                 description: 'A BIG WHITE house',
                 price: '160.50')
  end

  scenario 'A signed in user can request to book a space for a night' do
    sign_in
    visit '/spaces'
    expect(page).to have_content 'The White House'
    click_link 'The White House'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'A BIG WHITE house'
    fill_in 'Booking Date', with: '04/07/2017'
    click_button 'Request Booking'
  end

end
