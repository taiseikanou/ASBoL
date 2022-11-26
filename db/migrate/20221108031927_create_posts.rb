class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :comment
      t.integer :genre
      t.integer :atmosphere
      t.string :shop_name
      t.integer :member_id
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :category
      t.string :asbol
      t.timestamps
    end
  end
end
