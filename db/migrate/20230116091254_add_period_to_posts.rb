class AddPeriodToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :period, :date
  end
end
