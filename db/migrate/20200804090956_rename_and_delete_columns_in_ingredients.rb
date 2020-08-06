class RenameAndDeleteColumnsInIngredients < ActiveRecord::Migration[5.2]
  def change
    remove_column :ingredients, :float
    change_column :ingredients, :weight_optional, 'float USING CAST(weight_optional AS float)'
  end
end