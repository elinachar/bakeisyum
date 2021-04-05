class CreateTranslationInstagramPosts < ActiveRecord::Migration[5.2]
  def self.up
    InstagramPost.create_translation_table! :recipe_title => :string
  end
  
  def self.down
    InstagramPost.drop_translation_table!
  end
end
