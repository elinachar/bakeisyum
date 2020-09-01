class Part < ApplicationRecord
  belongs_to :recipe
  has_many :ingredients, dependent: :destroy, inverse_of: :part
  has_many :instructions, dependent: :destroy, inverse_of: :part

  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :instructions, allow_destroy: true, reject_if: :all_blank

  default_scope { order(:id) }
end
