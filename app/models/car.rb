class Car < ApplicationRecord
  validates :name, format: { with: /\A[a-zA-Z\d-]{1,15}\z/ }

  validates :colour, format: { with: /\A[a-zA-Z\d-]{1,20}\z/ }

  validates :vin_number, uniqueness: true,
                         length: { is: 17 },
                         format: { with: /\A[A-Z0-9]+\z/ }

  validates :license_plate, format: { with: /\A[A-Z0-9]{2,3}[\d-][A-Z0-9]{4,5}\z/ },
                            uniqueness: true,
                            length: { is: 8 }

  validates :year_of_production, numericality: true,
                                 length: { is: 4 },
                                 inclusion: { in: 1900..Time.now.year }

  validates :year_of_registration, numericality: true,
                                   length: { is: 4 },
                                   inclusion: { in: 1900..Time.now.year }
end
