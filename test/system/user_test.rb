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
    fill_in 'Email', with: 'test@test.pl'
    click_on 'Log in'

    assert_selector 'h2', text: 'Invalid Email or password.'
  end

  test 'invalid password 10 times and lock user(failed attempts)' do
    visit root_url
    click_on 'Log out'

    10.times do
      visit new_user_session_url

      fill_in 'Email', with: @user.email
      fill_in 'Password', with: 'passwor'

      click_on 'Log in'
    end

    assert_selector 'h2', text: 'Your account is locked.'
  end
end
# You have one more attempt before your account is locked.
