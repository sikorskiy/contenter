class SeasonType < ApplicationRecord
  has_many :seasonships
  has_many :camps, through: :seasonships
end
