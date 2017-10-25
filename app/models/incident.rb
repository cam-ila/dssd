class Incident < ApplicationRecord
  has_many :replacements
  
  accepts_nested_attributes_for :replacements
end
