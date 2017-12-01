class Contribution < ApplicationRecord
  belongs_to :user
  belongs_to :fund
  belongs_to :trip

  validates :amount, presence: true
end
