class RenameReviewedToComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :reviewed, :approved
  end
end
