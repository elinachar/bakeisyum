class Instruction < ApplicationRecord
  belongs_to :part
  default_scope { order(:id) }
end
