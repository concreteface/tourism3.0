require 'rails_helper'

feature 'user can view location and description of attraction on show page' do

  before :each do
    @attraction = FactoryGirl.create(:attraction)
    @attraction.add_photo('test.jpg')
    @user = FactoryGirl.create(:user)
  end

  scenario 'user sees attraction information' do
    visit attraction_path(@attraction)

    expect(page).to have_content(@attraction.description)
    expect(page).to have_css("img[src*='test.jpg']")
    expect(page).to have_content(@attraction.name)
    

  end


end
