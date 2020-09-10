class AddTagsToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :keywords, :string
  end
end
