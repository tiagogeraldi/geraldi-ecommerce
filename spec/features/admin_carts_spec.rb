require 'spec_helper'

RSpec.feature "managing carts", type: feature do
  include LoginHelper
    
  before do
    login_admin
  end

  scenario "listing a category" do
    create :cart, user: User.first
    
    click_link 'Cart'

    expect(page).to_not have_link('New')
    expect(page).to_not have_button('Search')

    expect(page).to have_content 'sneakers'
    expect(page).to have_content '100'
    expect(page).to have_content 'test@test.com'
  end
end
