require 'spec_helper'

RSpec.feature "managing brands", type: feature do
  include LoginHelper
    
  before do
    login_admin
  end

  scenario "create, update and destroy a brand" do
    click_link 'Brand'
    click_link 'New'

    fill_in 'Name', with: 'Adidas'
    click_button 'Save and Close'

    click_link 'Adidas'
    fill_in 'Name', with: 'Puma'
    click_button 'Save and Close'

    fill_in 'Keyword...', with: 'non-existing'
    click_button 'Search'
    expect(page).to_not have_content 'Puma'

    fill_in 'Keyword...', with: 'pum'
    click_button 'Search'
    expect(page).to have_content 'Puma'

    first('.delete').click
    expect(page).to_not have_content 'Puma'
  end
end
