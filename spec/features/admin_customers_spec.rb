require 'spec_helper'

RSpec.feature "managing customers", type: feature do
  include LoginHelper
    
  before do
    login_admin
  end

  scenario "create, update and destroy a customer" do
    click_link 'Customer'
    click_link 'New'

    fill_in 'Name', with: 'Tiago A. Geraldi'
    fill_in 'Email', with: 'tiago@geraldi.info'
    fill_in 'Password', with: '123123'
    fill_in 'Password confirmation', with: '123123'
    click_button 'Save and Close'

    expect(page).to have_content('Tiago A. Geraldi')

    first('.fa-pencil').click
    fill_in 'Name', with: 'Tiago Andre Geraldi'
    click_button 'Save and Close'

    fill_in 'Keyword...', with: 'non-existing'
    click_button 'Search'
    expect(page).to_not have_content('Tiago A. Geraldi')

    fill_in 'Keyword...', with: 'gerald'
    click_button 'Search'
    expect(page).to have_content 'Tiago A. Geraldi'

    first('.delete').click
    expect(page).to_not have_content 'Tiago A. Geraldi'
  end
end
