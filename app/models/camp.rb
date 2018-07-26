class Camp < ApplicationRecord
  has_one :content_camp
  belongs_to :company
  has_many :seasonships
  has_many :season_types, through: :seasonships
end
