class CreateTableMileage < ActiveRecord::Migration[5.2]
  def change
    create_table :mileages do |t|
      t.integer :distance

      t.timestamps
    end

    add_reference :mileages, :car
    add_foreign_key :mileages, :cars
  end
end
