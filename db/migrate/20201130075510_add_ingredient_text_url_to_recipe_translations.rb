class AddIngredientTextUrlToRecipeTranslations < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        Recipe.add_translation_fields! ingredients_text_image_url: :string
      end

      dir.down do
        remove_column :recipe_translations, :slug
      end
    end
  end
end
