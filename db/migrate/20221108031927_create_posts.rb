class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :explanation
      t.string :shop_name
      t.integer :member_id
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :category
      t.timestamps
    end
  end
end
