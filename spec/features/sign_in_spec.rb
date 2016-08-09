feature "Sign in" do
  before do
    User.create(name: "Bob", email: "bobby90@mail.com",
                password: "qwerty", password_confirmation: "qwerty" )
    visit "/users/signin"
  end
  scenario "user can sign in to his account" do
    fill_in "email", with: "bobby90@mail.com"
    fill_in "password", with: "qwerty"
    expect{ click_button "Sign in" }.not_to change(User, :count)
    expect(page).to have_content("Welcome Bob!")
  end
  scenario "user can't sign in with invalid email" do
      fill_in "email", with: "bobby09@mail.com"
      fill_in "password", with: "qwerty"
      click_button "Sign in"
    expect(page).to have_content "Invalid password or email!"
  end
  scenario "user can't sign in with invalid password" do
    fill_in "email", with: "bobby90@mail.com"
    fill_in "password", with: "qwert"
    click_button "Sign in"
    expect(page).to have_content "Invalid password or email!"
  end
end
