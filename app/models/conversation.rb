class Conversation < ApplicationRecord
  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'
  has_many :messages, dependent: :destroy
  validates :sender_id, uniqueness: { :scope => :recipient_id }


  has_one :most_recent_message, -> { order('created_at DESC')  }, class_name: 'Message'
  belongs_to :experience


   # scope :between, -> (sender_id,recipient_id) do
   #   where(“(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)”, sender_id,recipient_id, recipient_id, sender_id)
  # end

  def self.between(sender_id, recipient_id, experience_id)
    where("(conversations.sender_id = ? AND conversations.recipient_id = ? AND conversations.experience_id = ?) OR
           (conversations.sender_id = ? AND conversations.recipient_id = ? AND conversations.experience_id = ?)", sender_id, recipient_id, experience_id, recipient_id, sender_id, experience_id)
  end

end


