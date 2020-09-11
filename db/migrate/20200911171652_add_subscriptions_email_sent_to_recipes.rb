class AddSubscriptionsEmailSentToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :new_recipe_email_sent, :boolean, default: false
  end
end
