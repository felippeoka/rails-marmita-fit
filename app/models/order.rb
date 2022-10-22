class Order < ApplicationRecord
  belongs_to :user
  belongs_to :lunchbox

  validates :user_id, :presence => true, uniqueness: { scope: :user_id}
  validates :lunchbox_id, :presence => true, uniqueness: { scope: :lunchbox_id}
end
