require 'spec_helper'

RSpec.feature "managing users", type: feature do
  include LoginHelper
    
  before do
    login_admin
  end

  scenario "create, update and destroy an user" do
    click_link 'User'
    click_link 'New'

    fill_in 'Name', with: 'New Tester'
    fill_in 'Email', with: 'newtest@test.com'
    fill_in 'Password', with: '123123'
    fill_in 'Password confirmation', with: '123123'
    click_button 'Save and Close'

    first('.fa-pencil').click
    expect(page).to have_field('Name', with: 'New Tester')
    fill_in 'Email', with: 'otherthing@test.com'
    click_button 'Save and Close'

    first('.delete').click
    expect(page).to_not have_content 'newtest@test.com'

    fill_in 'Keyword...', with: 'test'
    expect(page).to have_content 'test@test.com'

    click_button 'Search'
    expect(page).to have_content 'test@test.com'

    fill_in 'Keyword...', with: 'non-existing'
    click_button 'Search'
    expect(page).to_not have_content '.com'
  end
end
