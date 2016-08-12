require 'byebug'

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
  visit "/users/signin"
  fill_in "email", with: "bobby90@mail.com"
  fill_in "password", with: "qwerty"
  click_button "Sign in"
end

def add_space(name: 'The White House',
             address: '1600 Pennsylvania Avenue',
             description: 'A BIG WHITE house',
             price: '160.50',
             available_from: '12/12/2016',
             available_to: '13/12/2016'
             )
  visit "/spaces/new"
  fill_in :name, with: name
  fill_in :address, with: address
  fill_in :description, with: description
  fill_in :price, with: price
  fill_in :available_from, with: available_from
  fill_in :available_to, with: available_to
  click_button 'Add Space'
end
