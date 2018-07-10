class RemoveUserIdColumnFromComments < ActiveRecord::Migration[5.2]

  def self.up
    remove_column :comments, :user
  end
end
