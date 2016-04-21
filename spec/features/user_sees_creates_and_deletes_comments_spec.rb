require 'rails_helper'

feature 'user can read and leave comments on attraction index page' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @attraction = FactoryGirl.create(:attraction)
  end

  scenario 'authenticated user visits attraction index to read comments', js: true do
    login_as(@user)
    visit '/'
    click_link 'Show Comments'
    click_link 'New Comment'
    fill_in 'comment[body]', with: 'This place is neato!'
    click_button 'Post Comment'
    find('.thread_comment_list')
    visit '/'
    click_link 'Show Comments'
  end

  # scenario 'authenticated user can leave a comment' do
  #   @attraction = FactoryGirl.create(:attraction)
  #   login_as(@user)
  #   visit '/'
  #   click_button 'Show Comments'

  #   fill_in "Leave a Comment", with: "This picture is OK squared!"
  #   click_on 'Comment'
  #   expect(page).to have_content('This picture is OK squared!')
  # end

  # scenario 'authenticated submits blank form' do
  #   @attraction = FactoryGirl.create(:attraction)
  #   login_as(@user)
  #   visit '/'
  #   click_button 'Show Comments'

  #   message = accept_prompt do
  #     click_on 'Comment'
  #   end
  #   expect(message).to eq('Write Something Before You Press That Button!')

  # end

  # scenario 'unauthenticated user can\'t leave a comment' do
  #   @attraction = FactoryGirl.create(:attraction)
  #   visit '/'
  #   click_button 'Show Comments'

  #   expect(page).to have_no_css('#body')

  # end

  # scenario 'authenticated user can delete their own comment' do
  #   @comment = FactoryGirl.create(:comment, user: @user)
  #   login_as(@user)
  #   visit '/'
  #   click_button 'Show Comments'

  #   expect(page).to have_content(@comment.body)
  #   click_button 'Delete'
  #   expect(page).not_to have_content(@comment.body)
  # end
end
