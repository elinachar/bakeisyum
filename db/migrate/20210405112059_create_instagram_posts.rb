class CreateInstagramPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :instagram_posts do |t|

      t.timestamps
    end
  end
end
