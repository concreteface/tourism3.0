require 'rails_helper'

feature 'user can update photo title and description' do
  before :each do
    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
    @attraction = FactoryGirl.create(:attraction, creator: @user)
  end

  scenario 'user who created it visits attraction page to change description' do
    login_as(@user)
    visit attraction_path(@attraction)

    expect(page).to have_content("It's been there a while")

    click_link 'detail_button'
    fill_in 'Description', with: "Someone fell there"
    click_button 'Submit'

    expect(page).to have_content('Someone fell there')
  end

  scenario 'user didn\'t create it visits attraction page and can\'t change description' do
    login_as(@user2)
    visit attraction_path(@attraction)

    expect(page).not_to have_selector(:link, 'detail_button')
  end

  scenario 'user who submits invalid form' do
    login_as(@user)
    visit attraction_path(@attraction)

    expect(page).to have_content("It's been there a while")

    click_link 'detail_button'
    fill_in 'Name', with: ""
    click_button 'Submit'

    expect(page).to have_content("Name can't be blank")
  end
end
