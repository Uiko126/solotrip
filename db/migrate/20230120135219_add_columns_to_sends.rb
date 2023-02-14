class AddColumnsToSends < ActiveRecord::Migration[6.1]
  def change
    add_column :sends, :latitude, :float
    add_column :sends, :longitude, :float
  end
end
