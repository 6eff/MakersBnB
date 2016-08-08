feature "Sign up" do
  scenario "user can sign up to a new account" do
    visit "/users/new"
    fill_in "name", with: "Bob"
    fill_in "email", with: "bobby90@mail.com"
    fill_in "password", with: "qwerty"
    fill_in "confirm_password", with: "qwerty"
    click_button "Sign up"
    expect(page).to have_content("Welcome Bob!")
    expect{ user.count }.to change( User, :count ).by(1)
    expect(user.email).to eq "bobby90@mail.com"
  end
end
