class Car < ApplicationRecord
  validates :name, presence: true
  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: ' can only inlude letters'}
  validates :name, :length => { maximum: 15, message: ' should be short one and in one word, maximum 15 characters'}
  validates :colour, presence: true
  validates :colour,  format: { with: /\A[a-zA-Z]+\z/, message: ' can only inlude letters'}
  validates :vin_number, presence: true, uniqueness: true
  validates :vin_number, format: { with: /\A[a-zA-Z0-9]+\z/, message: ' can only inlude letters and numbers'}
  validates :license_plate, presence: true, uniqueness: true
  validates :license_plate, format: { with: /\A[a-zA-Z0-9\-]+\z/, message: ' can only inlude letters, numbers and hyphen'}
  validates :year_of_production, presence: true, numericality: true
  validates :year_of_production, :length => { is: 4, message: ' should be 4 digit and only digit' }
  validates :year_of_production, inclusion: { in: 1900..Time.now.year, message: ' should be between 1900 and the current year'}
  validates :year_of_registration, presence: true, , numericality: true
  validates :year_of_registration, :length => { is: 4, message: ' should be 4 digit and only digit' }
  validates :year_of_registration, inclusion: { in: 1900..Time.now.year, message: ' should be between 1900 and the current year'}
end
