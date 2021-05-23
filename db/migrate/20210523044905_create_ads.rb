class CreateAds < ActiveRecord::Migration[6.1]
  enable_extension('citext')
  def change
    create_table :ads do |t|
      t.citext :title, null: false
      t.text :description, null: false
      t.decimal :price, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :ads, :title, unique: true
  end
end
