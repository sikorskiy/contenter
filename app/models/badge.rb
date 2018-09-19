class Badge < ApplicationRecord
  has_one_attached :main_picture
  has_one :status
end
