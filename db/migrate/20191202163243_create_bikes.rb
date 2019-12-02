class CreateBikes < ActiveRecord::Migration[5.2]
  def change
    create_table :bikes do |t|
      t.string :name
      t.string :category
      t.integer :price
      t.text :description
      t.references :user, foreign_key: true
      t.string :address

      t.timestamps
    end
  end
end
