class AddNewColumnNameToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :name, :string
  end
end
