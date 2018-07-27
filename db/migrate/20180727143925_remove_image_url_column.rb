class RemoveImageUrlColumn < ActiveRecord::Migration[5.2]
  def self.up
  remove_column :recipes, :image_url
end
end
