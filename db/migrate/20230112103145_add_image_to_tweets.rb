class AddImageToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :image2, :string
  end
end
