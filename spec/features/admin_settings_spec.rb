require 'spec_helper'

RSpec.feature "managing setttings", type: feature do
  include LoginHelper
    
  before do
    login_admin
  end

  scenario "create, update and destroy a setting" do
    click_link 'Setting'
    click_link 'New'

    fill_in 'Name', with: 'new-setting'
    fill_in 'Description', with: 'new-value'
    click_button 'Save and Close'

    expect(page).to have_content 'new-setting'

    first('.fa-pencil').click
    fill_in 'Name', with: 'changing-value'
    screenshot_and_save_page
    click_button 'Save and Close'

    expect(page).to have_content 'changing-value'

    first('.fa-pencil').click
    click_link 'Delete'

    expect(page).to_not have_content 'changing-value'
  end
end
