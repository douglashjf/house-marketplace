class AddRegionToHouses < ActiveRecord::Migration[7.0]
  def change
    add_column :houses, :region, :string
  end
end
