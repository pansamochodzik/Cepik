# frozen_string_literal: true

require 'test_helper'

class MileageTest < ActiveSupport::TestCase
  def setup
    car = cars(:mercedes)
    second_car = cars(:toyota)
    car.mileages.build(distance: 10000).save
    second_car.mileages.build(distance: 10000).save
    @mileage = car.mileages.last
    @mileage_two = second_car.mileages.last
    @chars = %w(! @ # $ % ' ^ & * ( ) _ + { } | : " > ? < [ ] | = ; . ~ ` , -)
  end

  test 'validation' do
    binding.pry
    assert @mileage.valid?
    assert @mileage_two.valid?
  end

  test 'mileage distance can be blank?' do
    @mileage.distance = ''
    assert @mileage.invalid?
  end

  test 'mileage distance can have more than 7 characters?' do
    @mileage.distance = 12345678
    assert @mileage.invalid?
  end

  test 'mileage car_id can be blank?' do
    @mileage.car_id = ''
    assert @mileage.invalid?
  end

  test 'mileage car_id can be the same for many mileages?' do
    @mileage_two.car_id = @mileage.car_id
    assert @mileage_two.valid?
  end

  test 'mileage distance can have letters?' do
    @mileage.distance = 'ABCder'
    assert @mileage.invalid?
  end

  test 'mileage distance accepts any special character?' do
    @chars.each do |char|
      @mileage.distance = char
      assert @mileage.invalid?
    end
  end

  test 'mileage distance can have spaces between characters?' do
    @mileage.distance = '123 123'
    assert @mileage.invalid?
  end
end
