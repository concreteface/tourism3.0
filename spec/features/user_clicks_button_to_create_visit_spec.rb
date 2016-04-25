require 'rails_helper'

feature 'user can create a visit by clicking a button', js: true do

  before(:each) do
    @attraction = FactoryGirl.create(:attraction)
    @user = FactoryGirl.create(:user)
  end

  scenario 'authenticated user visits attraction index page' do
    login_as(@user)
    visit '/'
    click_button 'Been There'
    page.reset!
    expect(page).not_to have_button('Been There')
  end

  scenario 'unauthenticated user visits attraction index page' do
    visit '/'

    expect(page).not_to have_button('Been There')
  end


end
