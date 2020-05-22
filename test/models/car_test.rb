require 'test_helper'

class CarTest < ActiveSupport::TestCase
  def setup
    @car = Car.new(
      name: 'Mercedes_Benz',
      colour: 'Gray-Metallic',
      vin_number: 'ASDFGHJKL12345678',
      license_plate: 'WH-AWMA1',
      year_of_production: 2012,
      year_of_registration: 2012
    )
  end

  test 'valid car' do
    assert @car.valid?, 'Some of validation goes wrong'
  end

  test 'invalid without name' do
    @car.name = nil
    refute @car.valid?, 'car is valid without a name'
    assert_not_nil @car.errors[:name], 'no validation error for name present'
  end
  #
  # test 'invalid without colour' do
  #   car = Car.new(name: 'John')
  #   refute car.valid?
  #   assert_not_nil car.errors[:colour]
  # end
end
