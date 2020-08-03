class CreateDescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :descriptions do |t|
      t.text :description
      t.string :image_url
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
