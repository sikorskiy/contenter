require 'csv'

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
  belongs_to :iteration

  accepts_nested_attributes_for :reviews, allow_destroy: true
  accepts_nested_attributes_for :group_leaders, allow_destroy: true
  accepts_nested_attributes_for :camp_shifts, allow_destroy: true

  def self.as_csv
    CSV.generate do |csv|
      columns = %w(id url name facebook vk incamp_url ml_url dt_url bc_url pd_url inlearno_url created_at updated_at company_id preview program study accommodation meal security pricing adds latitude longitude starting_age finish_age foundation_year kids_in_camp kids_in_group leaders_per_group promo_day photos video_links comment schedule user_id presentation has_incamp_price group_leader_anounce)
      csv << columns.map(&:humanize)
      Camp.where(is_approved: 0).find_each do |c|
        csv << c.attributes.values_at(*columns)
      end
    end
  end

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
    score += 1 unless presentation.nil?
    score += 2 unless preview.blank?
    score += 2 unless program.blank?
    score +=2 unless study.blank?
    score +=2 unless schedule.blank?
    score +=2 unless accommodation.blank?
    score +=1 unless meal.blank?
    score +=2 unless security.blank?
    score +=1 unless seasonships.blank?
    score +=1 unless camp_categories.blank?
    score +=1 unless pricing.blank?
    score +=1 unless adds.blank?
    score +=1 unless latitude.blank?
    score +=1 unless longitude.blank?
    score +=1 unless geotags.blank?
    score +=1 unless starting_age.blank?
    score +=1 unless finish_age.blank?
    score +=1 unless foundation_year.blank?
    score +=1 unless kids_in_camp.blank?
    score +=1 unless kids_in_group.blank?
    score +=1 unless leaders_per_group.blank?
    score +=1 unless promo_day.nil?
    score +=1 unless photos.blank?
    score +=1 unless video_links.blank?
    score +=2 unless group_leader_anounce.blank?
    score +=2 unless group_leaders.blank?
    score +=2 unless reviews.blank?
    score +=1 unless is_finished.nil?
    full = score.to_f / max_score
    fl = full * 100
    return fl.to_i
  end
end
