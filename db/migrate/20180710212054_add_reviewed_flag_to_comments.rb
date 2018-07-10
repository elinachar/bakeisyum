class AddReviewedFlagToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :reviewed, :boolean, default: false, null: false
  end
end
