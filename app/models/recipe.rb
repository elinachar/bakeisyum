class Recipe < ApplicationRecord
  has_many :descriptions, dependent: :destroy, inverse_of: :recipe
  has_many :ratings
  has_many :parts, dependent: :destroy, inverse_of: :recipe
  has_many :ingredients, through: :parts
  has_many :instructions, through: :parts
  has_many :notes, dependent: :destroy, inverse_of: :recipe
  has_many :comments

  accepts_nested_attributes_for :descriptions, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :parts, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :notes, allow_destroy: true, reject_if: :all_blank

  mount_uploader :image_url, ImageUploader

  def self.search(search_term)
    if Rails.env.production?
      Recipe.where('name ilike :search OR description LIKE :search', search: "%#{search_term}%")
    else
      Recipe.where('name LIKE :search OR description LIKE :search', search: "%#{search_term}%")
    end
  end

  def to_param
    name.downcase.parameterize
  end

end
