class Description < ApplicationRecord
  belongs_to :recipe

  mount_uploader :image_url, ImageUploader
end
