require 'rails_helper'

feature 'authenticated user can add attraction' do

  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  scenario 'authenitcated user adds attraction photo, name and description' do
    login_as(@user)
    visit root_path
    click_on 'Add Photo'

    fill_in 'Name', with: "Gnome"
    fill_in 'Description', with: "An interesting statue somewhere"
    attach_file :attraction_photo, "#{Rails.root}/gnome.jpg"
    click_on 'Submit'

    expect(page).to have_content("You added a photo!")
    expect(page).to have_content("Gnome")
    expect(page).to have_content("An interesting statue somewhere")
    expect(page).to have_css("img[src*='gnome.jpg']")
  end

  scenario 'authenitcated user fills in form incorrectly' do
    login_as(@user)
    visit root_path
    click_on 'Add Photo'

    fill_in 'Description', with: "An interesting statue somewhere"
    attach_file :attraction_photo, "#{Rails.root}/gnome.jpg"
    click_on 'Submit'

    expect(page).to have_content("Name can't be blank")
    expect(page).not_to have_content("An interesting statue somewhere")
    expect(page).not_to have_css("img[src*='gnome.jpg']")

  end

  scenario 'unauthenticated user can\'t add attraction' do
    visit root_path
    
    expect(page).not_to have_selector(:link, 'Add Photo')
  end

end
