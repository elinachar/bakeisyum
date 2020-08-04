class CreateParts < ActiveRecord::Migration[5.2]
  def change
    create_table :parts do |t|
      t.string :name
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
