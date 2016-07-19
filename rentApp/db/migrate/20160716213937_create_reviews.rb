class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :text
      t.string :title
      t.integer :user_id
      t.integer :property_id
      t.datetime :timestamp

      t.timestamps null: false
    end
  end
end
