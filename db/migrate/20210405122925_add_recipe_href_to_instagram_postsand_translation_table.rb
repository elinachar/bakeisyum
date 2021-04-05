class AddRecipeHrefToInstagramPostsandTranslationTable < ActiveRecord::Migration[5.2]
  def change
    add_column :instagram_posts, :recipe_href, :string

    reversible do |dir|
      dir.up do
        InstagramPost.add_translation_fields! recipe_href: :string
      end

      dir.down do
        remove_column :instagram_post_translations, :recipe_href
      end
    end
  end
end
