class Comment < ApplicationRecord
  belongs_to :recipe

  validates :recipe, presence: true
  validates :body, presence: true
  validates :cοmmentator, presence: true
end
