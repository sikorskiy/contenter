class Company < ApplicationRecord
  has_many :camps
  has_many :content_camps, through: :camps

  validates :name, :entity, presence: true
end
