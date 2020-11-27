class Instruction < ApplicationRecord
  translates :instruction, fallbacks_for_empty_translations: true
  belongs_to :part
  default_scope { order(:id) }
end
