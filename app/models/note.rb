class Note < ApplicationRecord
  belongs_to :recipe
  default_scope { order(:id) }
end
