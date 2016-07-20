class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :streetaddress
      t.string :city
      t.string :state
      t.float :latitude
      t.float :longitude
      t.string :img
      t.string :type
      t.string :price
      t.string :sqft

      t.timestamps null: false
    end
  end
end
