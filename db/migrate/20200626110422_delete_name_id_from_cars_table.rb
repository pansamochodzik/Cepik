class DeleteNameIdFromCarsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :cars, :name_id
  end
end
