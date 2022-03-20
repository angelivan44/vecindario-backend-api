class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :content
      t.integer :likes_count
      t.integer :dislikes_count
      t.integer :comments_count
      t.string :email

      t.timestamps
    end
  end
end
