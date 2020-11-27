class Description < ApplicationRecord
  translates :description, fallbacks_for_empty_translations: true
  belongs_to :recipe
  default_scope { order(:id) }

  mount_uploader :image_url, ImageUploader

end
