# frozen_string_literal: true

class Country < ApplicationRecord
  has_many :cars

  scope :alphabetically, -> { order(:name) }
end
