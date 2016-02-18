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

    first('.fa-pencil').click
    expect(page).to have_field('Name', with: 'new-setting')
    fill_in 'Name', with: 'changing-value'
    click_button 'Save and Close'

    expect(page).to have_content 'changing-value'

    fill_in 'Keyword...', with: 'faceb'
    click_button 'Search'

    within 'table.table' do
      expect(page).to_not have_content 'new-setting'
      expect(page).to have_content 'facebook'
    end

    first('.delete').click
    expect(page).to_not have_content 'facebook'
  end
end
