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
    fill_in 'Category name', with: category.name
    fill_in 'Brand name', with: brand.name
    fill_in 'Height', with: 3
    fill_in 'Width', with: 10
    fill_in 'Weight', with: 1
    fill_in 'Depth', with: 16
    click_button 'Save'
    expect(page).to have_content('A largura nao pode ser inferior a 11 cm')
    fill_in 'Width', with: 12
    click_button 'Save and Close'

    expect(page).to have_content('Sneakers A')

    first('.fa-pencil').click
    fill_in 'Name', with: 'Sneakers B'
    click_button 'Save and Close'

    fill_in 'Keyword...', with: 'non-existing'
    click_button 'Search'
    expect(page).to_not have_content('Sneakers')

    fill_in 'Keyword...', with: 'sneak'
    click_button 'Search'
    expect(page).to have_content 'Sneakers B'

    first('.delete').click
    expect(page).to_not have_content 'Sneakers B'
  end
end
