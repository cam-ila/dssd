class Incident < ApplicationRecord
  has_many :replacements, inverse_of: :incident
  
  accepts_nested_attributes_for :replacements, reject_if: :all_blank, allow_destroy: true
end
