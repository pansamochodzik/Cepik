class ChangeColumnNameFromNameToBrand < ActiveRecord::Migration[5.2]
  def change
    rename_column :cars, :name, :brand
  end
end
