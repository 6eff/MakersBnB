feature 'New Booking Request' do

  let(:space) do
    Space.create(name: 'The White House',
                 address: '1600 Pennsylvania Avenue',
                 description: 'A BIG WHITE house',
                 price: '160.50')
  end

  scenario 'A signed in user can request to book a space for a night' do
    sign_in
    visit '/spaces'
  end

end
