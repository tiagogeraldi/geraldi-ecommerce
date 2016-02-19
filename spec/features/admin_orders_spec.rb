require 'spec_helper'

RSpec.feature "managing orders", type: feature do
  include LoginHelper
    
  before do
    login_admin
  end

  scenario "create, update and destroy an order" do
    create :customer
    create :product

    click_link 'Order'
    click_link 'New'

    select 'First customer', from: 'Customer'
    select 'Created', from: 'Status'

    click_link 'Add Product'
    select 'sneakers', from: 'Product'
    fill_in 'Quantity', with: 1

    click_link 'Add Tracking code'
    fill_in 'Tracking code', with: '#######'
    within '.shipping-fields' do
      fill_in 'Quantity', with: 1
    end

    click_button 'Save and Close'

    expect(page).to have_content 'First customer'
    expect(page).to have_content 'Created'

    first('.fa-pencil').click
    select 'Sent', from: 'Status'
    click_button 'Save and Close'

    expect(page).to have_content 'Sent'

    first('.delete').click
    expect(page).to_not have_content 'Sent'
  end
end
