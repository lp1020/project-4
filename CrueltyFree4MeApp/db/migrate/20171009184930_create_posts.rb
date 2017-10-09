class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.integer :category_id
      t.boolean :is_cruelty_free
      t.string :link

      t.timestamps
    end
    add_index :posts, :category_id
  end
end
