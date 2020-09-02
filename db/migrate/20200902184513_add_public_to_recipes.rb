class AddPublicToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :public, :boolean, default: false, null: false
  end
end
