class Recipe < ApplicationRecord
  has_many :comments

  def self.search(search_term)
    if Rails.env.production?
      Recipe.where('name ilike :search OR description LIKE :search', search: "%#{search_term}%")
    else
      Recipe.where('name LIKE :search OR description LIKE :search', search: "%#{search_term}%")
    end
  end

end
