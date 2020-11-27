class AddLanguageToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :language, :string
    add_column :users, :language, :string
  end
end
