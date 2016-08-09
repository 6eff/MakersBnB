feature "Sign up" do
  scenario "user can sign up to a new account" do
    visit "/users/signup"
    fill_in "name", with: "Bob"
    fill_in "email", with: "bobby90@mail.com"
    fill_in "password", with: "qwerty"
    fill_in "password_confirmation", with: "qwerty"
    expect{ click_button "Sign up" }.to change(User, :count).by(1)
    user = User.first
    expect(page).to have_content("Welcome Bob!")
    expect(user.email).to eq "bobby90@mail.com"
  end
end
