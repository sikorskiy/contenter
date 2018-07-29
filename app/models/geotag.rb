class Geotag < ApplicationRecord
  belongs_to :camp
  validates :name, uniqueness: true, presence: true
end
