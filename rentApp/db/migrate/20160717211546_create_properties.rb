class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :streetaddress
      t.string :city
      t.string :state
      t.float :latitude
      t.float :longitude
      t.string :sqfeet
      t.string :price
      t.string :img
      t.string :type
      t.text :description

      t.timestamps null: false
    end
  end
end
