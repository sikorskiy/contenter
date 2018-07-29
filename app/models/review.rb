class Review < ApplicationRecord
  belongs_to :review_role
  belongs_to :camp
end
