require 'rails_helper'

feature 'user can read and leave comments on attraction index page', js: true do
  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  scenario 'authenticated user visits attraction index to read comments' do
    @comment = FactoryGirl.create(:comment)
    login_as(@user)
    visit '/'

    expect(page).to have_css("img[src*='#{@comment.attraction.photo.url}']")
    expect(page).to have_content(@comment.body)
  end

  # scenario 'authenticated user can leave a comment' do
  # 	@attraction = FactoryGirl.create(:attraction)
  #   login_as(@user)
  #   visit '/'

  #   fill_in "Leave a Comment", with: "This picture is OK squared!"
  #   click_on 'Comment'
  #   # page.reset!
  #   expect(page).to have_content('This picture is OK squared!')
  # end

  # scenario 'unauthenticated user can\'t leave a comment' do

  #   visit '/'

  # end
end
