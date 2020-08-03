class AddWaitinTimeAndOriginalRecipeToRecipies < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :waiting_time, :string
    add_column :recipes, :original_recipie_name, :string
    add_column :recipes, :original_recipie_url, :string
  end
end
