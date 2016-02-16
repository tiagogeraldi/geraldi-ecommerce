require 'spec_helper'

RSpec.feature "the signin process", type: feature do
  include LoginHelper
    
  before do
    login_admin
  end

  scenario "admin log in" do
    expect(page).to have_content 'Dashboard'

    click_link 'Logoff'

    expect(page).to have_content 'Home'
  end
end
