class Taggization < ApplicationRecord
  belongs_to :camp
  belongs_to :geotag
  #validates :camp_id, uniqueness: { scope: :geotag_id }
end
