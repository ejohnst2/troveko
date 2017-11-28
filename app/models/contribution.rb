class Contribution < ApplicationRecord
  belongs_to :user
  belongs_to :fund

  validates :amount, presence: true
end
