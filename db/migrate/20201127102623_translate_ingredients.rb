class TranslateIngredients < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        Ingredient.create_translation_table!({
          :name => :string,
          :weight => :float,
          :weight_unit => :string,
          :weight_optional => :float,
          :weight_optional_unit => :string
        }, {
          :migrate_data => true
        })
      end

      dir.down do
        Ingredient.drop_translation_table! :migrate_data => true
      end
    end
  end
end
