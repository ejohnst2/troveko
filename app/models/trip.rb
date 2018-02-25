class Trip < ApplicationRecord
  belongs_to :experience
  belongs_to :user
  has_one :contribution#, dependent: :destroy
  has_many :orders#, dependent: :destroy

  validates :user, :experience, :start_date, presence: true, allow_blank: false
  validate :start_date_cannot_be_in_the_past
  validate :cannot_be_overbooking

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "Can't be in the past") if
      !start_date.blank? and start_date < Date.today
  end

  def cannot_be_overbooking
    errors.add(:number_of_people, "You've exceeded the capacity for this weekend") if
      number_of_people > (experience_id.capacity - start_date.number_of_people)
  end

end
