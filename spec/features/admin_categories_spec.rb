require 'spec_helper'

RSpec.feature "managing categories", type: feature do
  include LoginHelper
    
  before do
    login_admin
  end

  scenario "create, update and destroy a category" do
    click_link 'Category'
    click_link 'New'

    fill_in 'Name', with: 'Bags'
    click_button 'Save and Close'

    click_link 'Bags'
    fill_in 'Name', with: 'Shoes'
    click_button 'Save and Close'

    fill_in 'Keyword...', with: 'non-existing'
    click_button 'Search'
    expect(page).to_not have_content 'Shoes'

    fill_in 'Keyword...', with: 'sho'
    click_button 'Search'
    expect(page).to have_content 'Shoes'

    first('.delete').click
    expect(page).to_not have_content 'Shoes'
  end
end
