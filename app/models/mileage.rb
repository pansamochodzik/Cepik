class Mileage < ApplicationRecord
  belongs_to :car

  validates :distance, numericality: { only_integer: true },
                       length: { minimum: 1, maximum: 7 }

  validates :car_id, presence: true

  scope :newest, -> { order(created_at: :desc) }
end
