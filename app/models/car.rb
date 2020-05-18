class Car < ApplicationRecord
  validates :name, format: {with: /\A[a-zA-Z]{1,10}\z/, message: ' can only inlude letters and have maximum 10 characters. Cannot be blank'}
  validates :colour, format: {with: /\A[a-zA-Z]{1,15}\z/, message: ' can only inlude letters and have maximum 15 characters. Cannot be blank.'}
  validates :vin_number, uniqueness: true, :length => {is: 17}
  validates :vin_number, format: {with: /\A[A-Z0-9]+\z/, message: ' can only inlude capital letters and numbers/'}
  validates :license_plate, format: {with: /\A[A-Z0-9]{2,3}[\d-][A-Z0-9]{4,5}\z/, message: ' can only inlude capital letters, numbers and hyphen not space. Cannot be blank.'}
  validates :license_plate, uniqueness: true, :length => {is: 8}
  validates :year_of_production, numericality: true, :length => {is: 4}
  validates :year_of_production, inclusion: {in: 1900..Time.now.year, message: ' should be between 1900 and the current year.'}
  validates :year_of_registration, numericality: true, :length => {is: 4}
  validates :year_of_registration, inclusion: {in: 1900..Time.now.year, message: ' should be between 1900 and the current year.'}
end
