class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :comment  ,nill: false
      t.string :name   ,null: false
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
