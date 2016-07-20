class AddIdsToReviewsTable < ActiveRecord::Migration
  def change
    add_column :reviews, :user_id, :integer
    add_column :reviews, :property_id, :integer
  end
end
