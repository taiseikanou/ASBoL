class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :shop_comments
      t.integer :favorite_shop_id
      t.integer :member_id

      t.timestamps
    end
  end
end
