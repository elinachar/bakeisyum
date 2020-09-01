class Description < ApplicationRecord
  belongs_to :recipe
  default_scope { order(:id) }

  mount_uploader :image_url, ImageUploader
end
