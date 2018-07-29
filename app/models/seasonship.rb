class Seasonship < ApplicationRecord
  belongs_to :season_type
  belongs_to :camp
  validates :camp_id, uniqueness: { scope: :season_type_id }
end
