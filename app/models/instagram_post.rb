class InstagramPost < ApplicationRecord
  translates :recipe_title, :recipe_href, fallbacks_for_empty_translations: true

  mount_uploader :image_url, ImageUploader
end
