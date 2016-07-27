require 'rails_helper'

feature 'user can enter an address and distance and find attractions' do

  before :each do
    @attraction = FactoryGirl.create(:attraction)
    @user = FactoryGirl.create(:user)
  end

  scenario 'user enters search terms that include attractions' do
    login_as(@user)

    visit user_path(@user)

    fill_in('query', with: 'Numazu, Japan')
    fill_in('distance', with: '10')
    click_button 'Search'

    expect(page).to have_content(@attraction.name)
    expect(page).to have_content('within 10 miles')


    visit user_path(@user)

    fill_in('query', with: 'Boston')
    fill_in('distance', with: '100000000')
    click_button 'Search'

    expect(page).to have_content(@attraction.name)
    expect(page).to have_content('within 100000000 miles')

  end

  scenario 'user enters search terms that don\'t include attractions' do
    login_as(@user)

    visit user_path(@user)

    fill_in('query', with: 'Boston')
    fill_in('distance', with: '10')
    click_button 'Search'

    expect(page).not_to have_content(@attraction.name)
  end

  scenario 'user doesn\'t enter distance and it defaults to 10' do
    login_as(@user)

    visit user_path(@user)

    fill_in('query', with: 'Numazu, Japan')

    click_button 'Search'

    expect(page).to have_content(@attraction.name)
    expect(page).to have_content('within 10 miles')

  end


end
