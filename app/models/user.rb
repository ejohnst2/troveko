class User < ApplicationRecord
  after_create :send_welcome_email

  extend Devise::Models
  has_many :trips, dependent: :destroy
  has_many :experiences
  has_many :messages, dependent: :destroy
  has_many :identities, dependent: :destroy
  has_many :funds
  has_many :sender_conversations, :foreign_key => :sender_id, class_name: 'Conversation'
  has_many :recipient_conversations, :foreign_key => :recipient_id, class_name: 'Conversation'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, omniauth_providers: [:facebook, :twitter, :google_oauth2, :instagram]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

# def self.find_for_facebook_oauth(auth)
#     user_params = auth.slice(:provider, :uid)
#     user_params.merge! auth.info.slice(:email, :first_name, :last_name)
#     user_params[:facebook_picture_url] = auth.info.image
#     user_params[:token] = auth.credentials.token
#     user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
#     user_params = user_params.to_h

#     user = User.find_by(provider: auth.provider, uid: auth.uid)
#     user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
#     if user
#       user.update(user_params)
#     else
#       user = User.new(user_params)
#       user.password = Devise.friendly_token[0,20]  # Fake password for validation
#       user.save
#     end

#     return user
#   end


#validates :terms_of_service, acceptance: { message: 'must be abided' }


  def twitter
    identities.where( :provider => "twitter" ).first
  end

  def twitter_client
    @twitter_client ||= Twitter.client( access_token: twitter.accesstoken )
  end

  def facebook
    identities.where( :provider => "facebook" ).first
  end

  def facebook_client
    @facebook_client ||= Facebook.client( access_token: facebook.accesstoken )
  end

  def instagram
    identities.where( :provider => "instagram" ).first
  end

  def instagram_client
    @instagram_client ||= Instagram.client( access_token: instagram.accesstoken )
  end

  def google_oauth2
    identities.where( :provider => "google_oauth2" ).first
  end

  def google_oauth2_client
    if !@google_oauth2_client
      @google_oauth2_client = Google::APIClient.new(:application_name => 'HappySeed App', :application_version => "1.0.0" )
      @google_oauth2_client.authorization.update_token!({:access_token => google_oauth2.accesstoken, :refresh_token => google_oauth2.refreshtoken})
    end
    @google_oauth2_client
  end

def unread_messages
  conversations_ids = self.recipient_conversations.ids + self.sender_conversations.ids
  my_messages = Message.where(conversation_id: conversations_ids, read: false).where.not(user_id: self.id)
  if my_messages.count > 0
    "(#{my_messages.count})"
  end
end

  private

  def send_welcome_email
    TestMailer.message(self).deliver_now
  end

  end

