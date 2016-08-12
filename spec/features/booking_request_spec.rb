feature 'New Booking Request' do

  before :each do
    sign_in
    click_button 'Add new space'
    fill_in 'Name of Space:', with: 'The White House'
    fill_in 'Address:', with: '1600 Pennsylvania Avenue'
    fill_in 'Description:', with: 'A BIG WHITE house'
    fill_in 'Price:', with: '160.50'
    fill_in 'Available from:', with: '03/07/2017'
    fill_in 'Available to:', with: '07/07/2017'
    click_button 'Add Space'
  end
  scenario 'A signed in user can request to book a space for a night' do
    visit '/spaces'
    expect(page).to have_content 'The White House'
    click_link 'The White House'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'A BIG WHITE house'
    fill_in 'Booking Date', with: '04/07/2017'
    click_button 'Request Booking'
  end

end
