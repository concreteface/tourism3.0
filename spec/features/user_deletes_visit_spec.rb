require 'rails_helper'

feature 'user can delete a visit with the click of a button', js: true do
  before :each do
    @user = FactoryGirl.create(:user)
    @attraction = FactoryGirl.create(:attraction)
    @visit = FactoryGirl.create(:visit, visitor: @user, visited_attraction: @attraction)
  end
  scenario 'user visits profile page' do
    login_as(@user)
    visit user_path(@user)

    click_on 'panel2v-label'
    expect(page).to have_content(@attraction.name)
    click_link "#{@attraction.id}"
    # find(".not-visited").trigger("click")
    page.reset!

    expect(page).not_to have_content(@attraction.name)


  end
end
