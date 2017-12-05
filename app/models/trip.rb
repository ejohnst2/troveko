class Trip < ApplicationRecord
  belongs_to :experience
  belongs_to :user
  has_one :contribution
  has_many :orders

  validates :user, :experience, :start_date, presence: true, allow_blank: false
  validate :start_date_cannot_be_in_the_past,
  #:end_date_cannot_be_in_the_past, :end_date_cannot_be_before_start_date
  # validate :start_date, :end_date

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "Can't be in the past") if
      !start_date.blank? and start_date < Date.today
  end

  def end_date_cannot_be_in_the_past
    errors.add(:expiration_date, "Can't be in the past") if
      !end_date.blank? and end_date < Date.today
  end

  def end_date_cannot_be_before_start_date
      errors.add(:end_date, "Can't be before start date") if
      !end_date.blank? and start_date > end_date
  end
end
