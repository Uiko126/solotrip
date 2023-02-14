class CreateSends < ActiveRecord::Migration[6.1]
  def change
    create_table :sends do |t|
      t.string :category
      t.string :title
      t.string :address
      t.text :detail

      t.timestamps
    end
  end
end
