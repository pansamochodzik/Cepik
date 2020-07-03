require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:user)
  end

  test 'user will be created correctly?' do
    assert @user.valid?
  end

  test 'user password can have lass than 8 characters?' do
    @user.password = 'passwor'

    assert @user.invalid?
  end

  test 'user email can be without sign @?' do
    @user.email = 'test.com'

    assert @user.invalid?
  end

  test 'user email can have two or more sign @?' do
    @user.email = 'test@test@test.com'

    assert @user.invalid?
  end

  test 'user email is unique?' do
    assert_equal 'test@test.com', @user.email
  end
end
