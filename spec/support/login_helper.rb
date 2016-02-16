module LoginHelper
  def login_admin
    visit '/admin'

    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '123123'
    click_button 'Sign in'
  end
end
