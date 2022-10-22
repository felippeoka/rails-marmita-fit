class Lunchbox < ApplicationRecord
  belongs_to :user

  validates :food, :size, :price, :presence => true
end
