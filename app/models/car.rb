# frozen_string_literal: true

class Car < ApplicationRecord
  before_save :create_name

  belongs_to :country
  has_many :mileages 

  accepts_nested_attributes_for :mileages

  validates :brand, format: { with: /\A[^\-^\W^\_\d]+[a-zA-Z\-\d]*[^\-^\W^\_\d]\z/ },
                    length: { minimum: 1, maximum: 15 }

  validates :colour, format: { with: /\A[^\-^\W^\_\d]+[a-zA-Z\-\d]*[^\-^\W^\_\d]\z/ },
                     length: { minimum: 1, maximum: 20 }

  validates :vin_number, uniqueness: true,
                         length: { is: 17 },
                         format: { with: /\A[A-Z0-9]+\z/ }

  validates :license_plate, format: { with: /\A[A-Z0-9]{2,3}[\-][A-Z0-9]{4,5}\z/ },
                            uniqueness: true,
                            length: { is: 8 }

  validates :year_of_production, numericality: true,
                                 length: { is: 4 },
                                 inclusion: { in: 1900..Time.now.year }

  validates :year_of_registration, numericality: true,
                                   length: { is: 4 },
                                   inclusion: { in: 1900..Time.now.year }

  private

  def create_name
    self.name = "#{brand}_#{year_of_production}_#{vin_number}"
  end
end
