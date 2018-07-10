class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.string :cοmmentator
      t.text :body
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
