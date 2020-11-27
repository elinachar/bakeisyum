class TranslateRecipes < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        Recipe.create_translation_table!({
          :name => :string,
          :short_description => :text,
          :serving => :string,
          :preparation_time => :string,
          :cooking_time => :string,
          :waiting_time => :string,
          :original_recipie_author => :string,
          :cuisine => :string,
          :keywords => :string
        }, {
          :migrate_data => true
        })
      end

      dir.down do
        Recipe.drop_translation_table! :migrate_data => true
      end
    end
  end
end
