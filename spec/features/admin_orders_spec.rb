require 'spec_helper'

RSpec.feature "managing products", type: feature do
  include LoginHelper
    
  before do
    login_admin
  end

  scenario "create, update and destroy a product" do
    brand    = create(:brand)
    category = create(:category)

    click_link 'Product'
    click_link 'New'

    fill_in 'Name', with: 'Sneakers A'
    fill_in 'Price', with: '200,00'
    fill_in 'Category name', with: 'Shoes'
    fill_in 'Brand name', with: 'Nike'
    click_button 'Save and Close'

    expect(page).to have_content('Sneakers A')

    first('.fa-pencil').click
    fill_in 'Name', with: 'Sneakers B'
    click_button 'Save and Close'

    fill_in 'Keyword...', with: 'non-existing'
    click_button 'Search'
    expect(page).to have_content('Sneakers')

    fill_in 'Keyword...', with: 'sneak'
    click_button 'Search'
    expect(page).to have_content 'Sneakers B'

    first('.delete').click
    expect(page).to_not have_content 'Sneakers B'
  end
end
