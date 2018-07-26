class CampSubcategory < ApplicationRecord
  belongs_to :camp_category
  validates :name, presence: true
end
