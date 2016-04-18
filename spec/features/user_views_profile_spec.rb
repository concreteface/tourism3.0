require 'rails_helper'

feature 'user sees visited, created and commented attractions' do
  before :each do
    @user = FactoryGirl.create(:user)
    @created = FactoryGirl.create(:attraction, creator: @user)
    @visited1 = FactoryGirl.create(:attraction)
    @visited2 = FactoryGirl.create(:attraction)
    @visited3 = FactoryGirl.create(:attraction)
    @user.visited_attractions << @visited1 << @visited2 << @visited3
  end

  scenario 'user visits profile page' do
    login_as(@user)
    visit user_path(@user)

    expect(page).to have_content(@user.username)
    expect(page).to have_content(@user.email)
    expect(page).to have_link(@created.name)
    expect(page).to have_link(@visited1.name)
    expect(page).to have_link(@visited2.name)
    expect(page).to have_link(@visited3.name)
  end
end
