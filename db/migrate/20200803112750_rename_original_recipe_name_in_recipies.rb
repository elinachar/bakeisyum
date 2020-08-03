class RenameOriginalRecipeNameInRecipies < ActiveRecord::Migration[5.2]
  def change
    rename_column :recipes, :original_recipie_name, :original_recipie_author
  end
end
