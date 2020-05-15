class Car < ApplicationRecord
  validates :name, presence: true, format: { with: /\A[a-zA-Z\-\s]+\z/, message: " can only inlude letters,hyphen and spaces"}
  validates :colour, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: " can only inlude letters"}
  validates :vin_number, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: " can only inlude letters and numbers"}
  validates :license_plate, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9\-]+\z/, message: " can only inlude letters, numbers and hyphen"}
  validates :license_plate, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9\-]+\z/, message: " can only inlude letters, numbers and hyphen"}
  validates :year_of_production, :year_of_registration, presence: true, :length => { is: 4, message: " should be 4 digit and only digit" }, numericality: true, inclusion: { in: 1900..Time.now.year, message: " should be between 1900 and the current year"}
end
