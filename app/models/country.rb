class Country < ApplicationRecord
  has_many :cars

  scope :alphabetically, -> { order(:country) }
end
