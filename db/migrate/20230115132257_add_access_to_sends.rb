class AddAccessToSends < ActiveRecord::Migration[6.1]
  def change
    add_column :sends, :access, :string
  end
end
