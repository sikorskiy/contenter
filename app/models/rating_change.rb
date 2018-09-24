class RatingChange < ApplicationRecord
  belongs_to :user
  belongs_to :rating_change_type
end
