class Geotag < ApplicationRecord
  has_many :taggizations
  has_many :camps, through: :taggizations
  validates :name, uniqueness: true, presence: true
end
