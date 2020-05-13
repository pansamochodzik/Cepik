class AddUniqueIndexToDatabase < ActiveRecord::Migration[5.2]
  def change
    add_index :cars, :vin_number, unique: true
    add_index :cars, :license_plate, unique: true
  end
end
