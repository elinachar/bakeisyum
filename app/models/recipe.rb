class Recipe < ApplicationRecord
  translates :name, :slug, :short_description, :ingredients_text_image_url, :serving, :preparation_time, :cooking_time, :waiting_time, :original_recipie_author, :cuisine, :keywords, fallbacks_for_empty_translations: true
  extend FriendlyId
  friendly_id :name, :use => :globalize
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
  mount_uploader :ingredients_image_url, ImageUploader
  mount_uploader :ingredients_text_image_url, ImageUploader

  def self.search(search_term,locale)
    # It works on production also for greek but not on development even search is in lower case
    Recipe.with_translations(locale).where('recipe_translations.name LIKE :search OR recipe_translations.keywords LIKE :search', search: "%#{search_term}%")
    # Recipe.with_translations(locale).where('LOWER(recipe_translations.name) LIKE :search OR LOWER(recipe_translations.keywords) LIKE :search', search: "%#{search_term.downcase}%")
  end


  # def to_param
  #   name.parameterize
  # end

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

end
