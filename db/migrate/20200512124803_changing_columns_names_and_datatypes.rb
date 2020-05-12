class ChangingColumnsNamesAndDatatypes < ActiveRecord::Migration[5.2]
  def change
    change_column :cars, :production_at, :integer
    change_column :cars, :registration_at, :integer
    rename_column :cars, :production_at, :year_of_production
    rename_column :cars, :registration_at, :year_of_registration
  end
end
