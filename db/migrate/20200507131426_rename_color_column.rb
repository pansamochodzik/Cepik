# frozen_string_literal: true

class RenameColorColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :cars, :color, :colour
  end
end
