class Categorization < ApplicationRecord
  belongs_to :camp
  belongs_to :camp_category
  validates :camp_id, uniqueness: { scope: :camp_category_id }
end
