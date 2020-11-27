class Note < ApplicationRecord
  translates :note, fallbacks_for_empty_translations: true
  belongs_to :recipe
  default_scope { order(:id) }
end
