class CampShift < ApplicationRecord
  belongs_to :camp
  #validates :camp_id, uniqueness: { scope: { :start, :finish, :price } }
end
