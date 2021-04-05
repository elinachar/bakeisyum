class AddColumnsToInstagramPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :instagram_posts, :image_url, :string
    add_column :instagram_posts, :recipe_title, :string
  end
end
