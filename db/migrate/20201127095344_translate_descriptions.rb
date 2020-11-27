class TranslateDescriptions < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        Description.create_translation_table!({
          :description => :text
        }, {
          :migrate_data => true
        })
      end

      dir.down do
        Description.drop_translation_table! :migrate_data => true
      end
    end
  end
end
