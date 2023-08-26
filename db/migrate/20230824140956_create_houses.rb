class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :address
      t.integer :price
      t.integer :bedroom
      t.integer :bathroom
      t.integer :square_feet
      t.text :description
      t.string :property_type
      t.string :tenure

      t.timestamps
    end
  end
end
