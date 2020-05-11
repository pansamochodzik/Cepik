class Car < ApplicationRecord
  validates :name, :colour, :vin_number, :license_plate, :production_at, :registration_at, presence: true
end
