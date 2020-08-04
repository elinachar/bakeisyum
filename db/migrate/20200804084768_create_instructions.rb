class CreateInstructions < ActiveRecord::Migration[5.2]
  def change
    create_table :instructions do |t|
      t.text :instruction
      t.references :part, foreign_key: true

      t.timestamps
    end
  end
end
