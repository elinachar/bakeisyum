class AddRecipeSquareImageUrlPhotographsToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :square_image_url, :string
    add_column :recipes, :photos_from, :string
    add_column :recipes, :photos_from_url, :string
  end
end
