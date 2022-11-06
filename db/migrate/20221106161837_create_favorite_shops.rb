class CreateFavoriteShops < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_shops do |t|
      t.integer :member_id
      t.text :explanation
      t.string :shop_name

      t.timestamps
    end
  end
end
