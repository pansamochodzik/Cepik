require 'application_system_test_case'

class ProjectTest < ApplicationSystemTestCase
  test 'visit index' do
    visit cars_path

    assert_selector 'h1', text: 'Welcome To Car List'
  end
end
