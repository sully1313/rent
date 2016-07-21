class AddNewColumnToProperty < ActiveRecord::Migration
  def change
    remove_column :properties, :type, :string
    add_column :properties, :spec, :string
  end
end
