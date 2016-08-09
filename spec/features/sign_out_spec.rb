feature "Sign out" do
  scenario "user can sign out from his account" do
    User.create(name: "Bob", email: "bobby90@mail.com",
                password: "qwerty", password_confirmation: "qwerty" )
    visit "/users/signin"
    fill_in "email", with: "bobby90@mail.com"
    fill_in "password", with: "qwerty"
    click_button "Sign in"
    click_button "Sign out"
    expect(page).to have_content "Goodbye!"
    expect(page).not_to have_content "Welcome Bob!"
  end
end
