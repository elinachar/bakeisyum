class TranslateInstructions < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        Instruction.create_translation_table!({
          :instruction => :text
        }, {
          :migrate_data => true
        })
      end

      dir.down do
        Instruction.drop_translation_table! :migrate_data => true
      end
    end
  end
end
