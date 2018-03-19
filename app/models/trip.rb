class Trip < ApplicationRecord

  belongs_to :experience
  belongs_to :user
  has_one :contribution#, dependent: :destroy
  has_many :orders#, dependent: :destroy

  validates :user, :experience, :start_date, :terms_and_conditions, presence: true, allow_blank: false
  validate :start_date_cannot_be_in_the_past
  validate :cannot_be_overbooking

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "Can't be in the past") if
      !start_date.blank? and start_date < Date.today
  end

  def cannot_be_overbooking
    total_people_booked = Trip.where(:start_date => start_date).sum(:number_of_people)

    if number_of_people > (experience.capacity - total_people_booked)
    errors.add(:number_of_people, "You've exceeded the host's capacity for this weekend. There are only #{experience.capacity - total_people_booked} spots left. Please choose a different date or take less people.")
  end
  end

end


