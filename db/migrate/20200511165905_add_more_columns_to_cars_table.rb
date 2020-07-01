# frozen_string_literal: true

class AddMoreColumnsToCarsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :vin_number, :string
    add_column :cars, :license_plate, :string
    add_column :cars, :production_at, :string
    add_column :cars, :registration_at, :string
  end
end
