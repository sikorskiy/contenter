class CampCategoryGroup < ApplicationRecord
  has_many :camp_category_groupings
  has_many :camp_categories, through: :camp_category_groupings
end
