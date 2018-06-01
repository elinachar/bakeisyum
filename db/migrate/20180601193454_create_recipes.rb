class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.string :serving
      t.string :image_url

      t.timestamps
    end
  end
end
