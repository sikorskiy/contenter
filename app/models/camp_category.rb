class CampCategory < ApplicationRecord
  has_many :camp_subcategories
  validates :name, presence: true
end
