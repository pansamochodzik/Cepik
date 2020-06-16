class ChangeColumnsNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :cars, :name, :brand
    rename_column :cars, :name_id, :name
  end
end
