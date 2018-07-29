class CampCategory < ApplicationRecord
  has_many :categorizations
  has_many :camps, through: :categorizations
  validates :name, presence: true
end
