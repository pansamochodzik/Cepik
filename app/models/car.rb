class Car < ApplicationRecord
  validates :name, :colour, :vin_number, :license_plate, :year_of_production, :year_of_registration, presence: true
  validates :vin_number, :license_plate, uniqueness: true
end
