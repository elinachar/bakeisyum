class Ingredient < ApplicationRecord
  translates :name, :weight, :weight_unit, :weight_optional, :weight_optional_unit, fallbacks_for_empty_translations: true
  belongs_to :part
  default_scope { order(:id) }
end
