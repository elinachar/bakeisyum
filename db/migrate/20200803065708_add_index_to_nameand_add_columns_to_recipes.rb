class AddIndexToNameandAddColumnsToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_index :recipes, :name
    add_column :recipes, :preparation_time, :string
    add_column :recipes, :cooking_time, :string
    rename_column :recipes, :description, :short_description
    rename_column :recipes, :image, :image_url
  end
end
