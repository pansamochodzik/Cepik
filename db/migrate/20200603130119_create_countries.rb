# frozen_string_literal: true

class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :country
      t.string :country_code

      t.timestamps
    end
  end
end
