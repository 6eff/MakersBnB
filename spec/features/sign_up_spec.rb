feature "Sign up" do
  scenario "user can sign up to a new account" do
    expect{ sign_up }.to change(User, :count).by(1)
    user = User.first
    expect(page).to have_content("Welcome Bob!")
    expect(user.email).to eq "bobby90@mail.com"
  end

  scenario 'user cannot sign up if confirmed password does not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users/create'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'user cannot sign up with an already registered email' do
    sign_up
    expect{ sign_up }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end
end
