def sign_up(name: 'Bob',
            email: 'bobby90@mail.com',
            password: 'qwerty',
            password_confirmation: 'qwerty'
            )
  visit "/users/signup"
  fill_in :name, with: name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

def sign_in
  User.create(name: "Bob",
              email: "bobby90@mail.com",
              password: "qwerty",
              password_confirmation: "qwerty" )
  visit "/users/signin"
  fill_in "email", with: "bobby90@mail.com"
  fill_in "password", with: "qwerty"
  click_button "Sign in"
end
