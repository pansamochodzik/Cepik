# frozen_string_literal: true

class AddColumnToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :registration_country, :string
  end
end
