# frozen_string_literal: true

class RenameNameColumnToBrandAndAddNewNameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :cars, :name, :brand
    add_column :cars, :name, :string
  end
end
