class Mileage < ApplicationRecord
  belongs_to :car

  validates :distance, format: { with: /\A[0-9]{1,7}\z/ }

  scope :newest, -> { order(created_at: :desc) }
end
