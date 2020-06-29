# frozen_string_literal: true

class AddUniqueIndexToCountriesTable < ActiveRecord::Migration[5.2]
  def change
    add_index :countries, :country, unique: true
    add_index :countries, :country_code, unique: true
  end
end
