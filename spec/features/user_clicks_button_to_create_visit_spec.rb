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
    expect(page).not_to have_button('Been There')
  end

  scenario 'unauthenticated user visits attraction index page' do
    visit '/'

    expect(page).not_to have_button('Been There')
  end

  scenario 'user deletes visit on profile page' do
    @visit = FactoryGirl.create(:visit, visitor: @user, visited_attraction: @attraction)
    login_as(@user)
    visit user_path(@user)

    click_link 'Your Visits'
    expect(page).to have_content(@attraction.name)
    click_button 'Nevermind'
    expect(page).not_to have_content(@attraction.name)

    expect(page).not_to have_button('Been There')
  end


end
