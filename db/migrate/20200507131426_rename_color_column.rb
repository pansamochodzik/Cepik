class RenemeColorColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :cars, :color, :colour
  end
end
