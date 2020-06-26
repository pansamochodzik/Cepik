class UpdateCarsTableNameColumnData < ActiveRecord::Migration[5.2]
  def self.up
    Car.find_each do |car|
      car.update(name: "#{car.brand}_#{car.year_of_production}_#{car.vin_number}")
    end
  end
end
