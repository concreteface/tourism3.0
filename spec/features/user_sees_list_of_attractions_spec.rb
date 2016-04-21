require 'rails_helper'

feature 'unauthenticated user sees list of attractions at root path' do

  scenario 'user visits root path' do
    attraction1 = FactoryGirl.create(:attraction)
    attraction2 = FactoryGirl.create(:attraction)
    attraction1.add_photo('test.jpg')
    attraction2.add_photo('test.jpg')

    visit '/'

    expect(page).to have_content(attraction1.name)
    expect(page).to have_content(attraction2.name)
    expect(page).to have_css("img[src*='#{attraction1.photo.url}']")
    expect(page).to have_css("img[src*='#{attraction2.photo.url}']")
  end

end