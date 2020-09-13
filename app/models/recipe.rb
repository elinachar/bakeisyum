class Recipe < ApplicationRecord
  has_many :descriptions, dependent: :destroy, inverse_of: :recipe
  has_many :ratings
  has_many :favorites
  has_many :parts, dependent: :destroy, inverse_of: :recipe
  has_many :ingredients, through: :parts
  has_many :instructions, through: :parts
  has_many :notes, dependent: :destroy, inverse_of: :recipe
  has_many :comments

  accepts_nested_attributes_for :descriptions, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :parts, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :notes, allow_destroy: true, reject_if: :all_blank

  mount_uploader :image_url, ImageUploader
  mount_uploader :square_image_url, ImageUploader

  def self.search(search_term)
    Recipe.left_outer_joins(:descriptions).left_outer_joins(:ingredients).where('recipes.name LIKE :search OR recipes.short_description LIKE :search  OR recipes.keywords LIKE :search OR descriptions.description LIKE :search OR ingredients.name LIKE :search', search: "%#{search_term}%")
  end

  def to_param
    name.parameterize
  end

end
