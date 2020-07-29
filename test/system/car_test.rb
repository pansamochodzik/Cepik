require 'application_system_test_case'

class CarTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    visit new_user_session_url
    sign_in users(:user)
    @car = cars(:mercedes)
  end

  test 'visit index' do
    visit cars_url

    assert_equal @car, cars(:mercedes)
    # selector 'h1', text: 'Welcome To Car List'
  end

  test 'create new car' do
    visit cars_url
    click_on 'Add new car'
    within('#new-car-form') do
      fill_in('Brand', with: 'Mercedes')
      fill_in('Colour', with: 'Red')
      fill_in('Vin number', with: 'VINNUMBER01234567')
      fill_in('License plate', with: 'D0-GAROW')
      select('Poland', from: 'car_country_id')
      fill_in('Year of production', with: '2016')
      fill_in('Year of registration', with: '2017')

      click_button('Save')
    end

    assert_current_path cars_path
    assert_selector 'h2', text: 'Successfully created.'
  end

  test 'visit show' do
    visit car_url(@car)

    assert_equal @car, cars(:mercedes)
  end

  test 'edit car' do
    visit car_url(@car)

    within('#car-table') do
      click_on 'Edit'
    end

    within('#edit-car-form') do
      fill_in('Brand', with: 'BMW')
      click_button('Save')
    end

    assert_current_path cars_path
    assert_selector 'h2', text: 'Successfully updated.'
  end

  test 'showing validation errors' do
    visit cars_url
    click_on 'Add new car'
    within('#car-form') do
      click_button('Save')
    end

    assert_selector 'h2', text: 'Errors:'
    assert_selector 'li'
  end
end
