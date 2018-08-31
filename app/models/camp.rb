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
 def fullness
  score = 0
  max_score = 37
  camp = Camp
  if  presentation.nil?
    score = score + 0
  else
    score = score + 1
  end
  if preview.blank?
    score = score + 0
  else 
    score = score + 2
  end
  if program.blank?
    score = score + 0 
  else
    score = score + 2
  end
  if  study.blank?
    score = score + 0
  else
    score = score + 2
  end
  if schedule.blank?
    score = score + 0
  else
    score = score + 2
  end
  if accommodation.blank?
    score = score + 0
  else
    score = score + 2
  end
  if  meal.blank?
    score = score + 0
  else
    score = score + 1
  end
  if  security.blank?
    score = score + 0
  else
    score = score + 2
  end
  if seasonships.blank?
    score = score + 0
  else
    score = score + 1
  end
  if  camp_categories.blank?
    score = score + 0
  else
    score = score + 1
  end
  if  pricing.blank?
    score = score + 0
  else
    score = score + 1
  end
   if  adds.blank?
    score = score + 0
  else
    score = score + 1
  end

   if  latitude.blank?
    score = score + 0
  else
    score = score + 1
  end
   if  longitude.blank?
    score = score + 0
  else
    score = score + 1
  end
   if  geotags.blank?
    score = score + 0
  else
    score = score + 1
  end
   if  starting_age.blank?
    score = score + 0
  else
    score = score + 1
  end
   if  finish_age.blank?
    score = score + 0
  else
    score = score + 1
  end
   if  foundation_year.blank?
    score = score + 0
  else
    score = score + 1
  end
  if  kids_in_camp.blank?
    score = score + 0
  else
    score = score + 1
  end
  if  kids_in_group.blank?
    score = score + 0
  else
    score = score + 1
  end
  if  leaders_per_group.blank?
    score = score + 0
  else
    score = score + 1
  end
  if  promo_day.nil?
    score = score + 0
  else
    score = score + 1
  end
  if  photos.blank?
    score = score + 0
  else
    score = score + 1
  end
  if  video_links.blank?
    score = score + 0
  else
    score = score + 1
  end
  if  group_leader_anounce.blank?
    score = score + 0
  else
    score = score + 2
  end
  if  group_leaders.blank?
    score = score + 0
  else
    score = score + 2
  end
  if  reviews.blank?
    score = score + 0
  else
    score = score + 2
  end
  if  is_finished.nil?
    score = score + 0
  else
    score = score + 1
  end
  full = score.to_f / max_score.to_f
  fl = full * 100
  return fl.to_i.to_s + "%"
 end

end
