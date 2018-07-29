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
  has_many :taggizations
  has_many :geotags, through: :taggizations
  belongs_to :user

  def self.next_camp_for_edition(user_id)
    #should be added choosing the same organization later
    camp = Camp.where('user_id = ? AND is_finished = FALSE', user_id) #already started camp
    if camp.blank?
      camp = Camp.where('is_finished IS NULL')
      return nil if camp.blank?
    end
    camp.first
  end

end
