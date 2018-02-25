class Trip < ApplicationRecord

  belongs_to :experience
  belongs_to :user
  has_one :contribution#, dependent: :destroy
  has_many :orders#, dependent: :destroy

  validates :user, :experience, :start_date, presence: true, allow_blank: false
  validate :start_date_cannot_be_in_the_past

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "Can't be in the past") if
      !start_date.blank? and start_date < Date.today
  end


end
