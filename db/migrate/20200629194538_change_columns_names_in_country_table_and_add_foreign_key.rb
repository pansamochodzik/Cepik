class ChangeColumnsNamesInCountryTableAndAddForeignKey < ActiveRecord::Migration[5.2]
  def change
    rename_column :countries, :country, :name
    rename_column :countries, :country_code, :code
    add_reference :cars, :country
    add_foreign_key :cars, :countries
  end
end
