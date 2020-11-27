class AddSlugToRecipesAndTranslationTable < ActiveRecord::Migration[5.2]
  def change
    add_index :recipes, :slug, unique: true

    reversible do |dir|
      dir.up do
        Recipe.add_translation_fields! slug: :string
      end

      dir.down do
        remove_column :recipe_translations, :slug
      end
    end
  end
end
