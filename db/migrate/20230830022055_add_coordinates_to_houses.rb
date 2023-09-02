class AddCoordinatesToHouses < ActiveRecord::Migration[7.0]
  def change
    add_column :houses, :latitude, :float
    add_column :houses, :longitude, :float
  end
end
