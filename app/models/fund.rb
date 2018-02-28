class Fund < ApplicationRecord
  belongs_to :user
  has_one :experience
  has_many :contributions
  validates :funding_goal, presence: true

  include PgSearch
  multisearchable against: [:title, :about]

end
