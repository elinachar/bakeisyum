class AddVideoUrlToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :video_url, :string 
  end
end
