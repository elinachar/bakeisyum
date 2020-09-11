class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.float :weight
      t.string :weight_unit
      t.float :weight_optional
      t.string :weight_optional_unit
      t.references :part, foreign_key: true

      t.timestamps
    end
  end
end
