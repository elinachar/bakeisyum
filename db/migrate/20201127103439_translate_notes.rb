class TranslateNotes < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        Note.create_translation_table!({
          :note => :text
        }, {
          :migrate_data => true
        })
      end

      dir.down do
        Note.drop_translation_table! :migrate_data => true
      end
    end
  end
end
