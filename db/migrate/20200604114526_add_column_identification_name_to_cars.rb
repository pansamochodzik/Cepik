class AddColumnIdentificationNameToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :name_id, :string
  end
end
