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

  accepts_nested_attributes_for :reviews, allow_destroy: true
  accepts_nested_attributes_for :group_leaders, allow_destroy: true
  accepts_nested_attributes_for :camp_shifts, allow_destroy: true

  def self.next_camp_for_edition(user_id)
    # should be added choosing the same organization later
    camp = Camp.where('user_id = ? AND (is_finished IS NULL OR is_finished = FALSE)', user_id) #already started camp
    if camp.blank?
      select_clause = 'DISTINCT camps.*'
      from_clause = 'camps, camps as other_camps'
      where_clause = 'camps.company_id = other_camps.company_id and camps.user_id = ? and camps.is_finished = TRUE and other_camps.is_finished IS NULL'
      camp = Camp.select(select_clause).where(where_clause, user_id).from(from_clause).all
      camp = Camp.where('is_finished IS NULL') if camp.blank?
      return nil if camp.blank?
    end
    camp.first
  end

end
