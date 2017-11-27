class Trip < ApplicationRecord
  belongs_to :experience
  belongs_to :user

  validates :user, :experience, :start_date, :end_date, presence: true
end
