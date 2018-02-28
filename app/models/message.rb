class Message < ApplicationRecord
  after_create :notify_recipient

  belongs_to :conversation
  belongs_to :user

  validates :header, :content, :conversation_id, :user_id, presence: true

  def message_time
    created_at.strftime('%m/%d/%y at %l:%M %p')
  end

private

  def notify_recipient
    UserMailer.message_receipt(self.conversation).deliver_now
  end

end


