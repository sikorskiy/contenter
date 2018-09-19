class Status < ApplicationRecord
  belongs_to :badge
  has_many :users
end
