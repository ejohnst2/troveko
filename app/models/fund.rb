class Fund < ApplicationRecord
  belongs_to :user
  has_one :experience
  has_many :contributions
  monetize :funding_goal_cents
  validates :funding_goal_cents, presence: true

  include PgSearch
  multisearchable against: [:title, :about]

end
