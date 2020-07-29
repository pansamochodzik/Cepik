require 'application_system_test_case'

class CarTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    visit new_user_session_url
    sign_in users(:user)
    @user = users(:user)
  end

  test 'sign out' do
    visit root_url
    click_on 'Log out'

    assert_current_path root_path
    assert_selector 'h2', text: 'Signed out successfully.'
  end

  test 'invalid email' do
    visit root_url
    click_on 'Log out'

    visit new_user_session_url
    fill_in 'Email', text: 'test@test.pl'
    click_on 'Log in'

    assert_selector
  end
end
