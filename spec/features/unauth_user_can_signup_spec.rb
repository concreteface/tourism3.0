require 'rails_helper'

feature "unauthenticated user can create account" do
  scenario "visit new user page" do
    visit '/users/sign_up'

    expect(page).to have_content('Email')
    expect(page).to have_content('Username')
    fill_in 'Email', with: 'yo@ho.com'
    fill_in 'Username', with: 'yohoho'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    attach_file :user_avatar, "#{Rails.root}/avatar.png"
    click_button 'Sign up'

    expect(page).to have_content('Signed up successfully.')
    expect(page).to have_content('Sign Out')
    expect(page).not_to have_content('Log in')
    expect(page).not_to have_content('Sign up')

    click_link 'Profile'
    expect(page).to have_content('yohoho')
    expect(page).to have_css("img[src*='avatar.png']")
  end
end
