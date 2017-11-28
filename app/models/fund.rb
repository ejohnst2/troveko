class Fund < ApplicationRecord
  belongs_to :user
  validates :funding_goal, presence: true
end
