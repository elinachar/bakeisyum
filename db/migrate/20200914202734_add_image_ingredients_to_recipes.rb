class AddImageIngredientsToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :ingredients_image_url, :string
    add_column :recipes, :ingredients_text_image_url, :string
  end
end
