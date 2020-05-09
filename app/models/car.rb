class Car < ApplicationRecord
  validates :name, :colour, presence: true
end
