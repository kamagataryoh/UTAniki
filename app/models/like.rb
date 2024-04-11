class Like < ApplicationRecord
  belongs_to :rider
  belongs_to :user
  validates_uniqueness_of :rider_id, scope: :user_id
end
