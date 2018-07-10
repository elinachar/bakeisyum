class AddAdminAuthorModeratorFlagsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean, default: false, null: false
    add_column :users, :author, :boolean, default: false, null: false
    add_column :users, :moderator, :boolean, default: false, null: false
  end
end
