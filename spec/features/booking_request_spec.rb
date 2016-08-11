feature 'New Booking Request' do

  before :each do
    sign_up #owner
    add_space
    # byebug
    click_button "Sign out"
  end

  scenario 'A signed in user can request to book a space for a night' do
    sign_up(name: "Pete",
                email: "pete90@mail.com",
                password: "qazwsx",
                password_confirmation: "qazwsx")
    click_button 'Main page'
    click_link 'The White House'
    expect(page).to have_content 'The White House'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'A BIG WHITE house'
    fill_in 'Booking Date', with: '04/07/2017'
    click_button 'Request Booking'
    expect(page).to have_content 'Your request was successfully submitted Bob'
  end

end
