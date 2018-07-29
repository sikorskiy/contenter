class Camp < ApplicationRecord
  belongs_to :company
  has_many :seasonships
  has_many :season_types, through: :seasonships
  has_many :camp_shifts
  has_many :geotags
  has_many :group_leaders
  has_many :reviews
  has_many :review_roles, through: :reviews
  has_many :categorizations
  has_many :camp_categories, through: :categorizations

  def self.next_camp_for_edition
    Camp.where('is_finished IS NULL OR is_finished = FALSE').first.id
  end

end
