class AddOverallToSends < ActiveRecord::Migration[6.1]
  def change
    add_column :sends, :overall, :integer
  end
end
