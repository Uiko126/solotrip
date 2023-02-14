class AddUserIdToSends < ActiveRecord::Migration[6.1]
  def change
    add_column :sends, :user_id, :integer
  end
end
