class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = Conversation.includes(:most_recent_message).where(
      "conversations.sender_id = ? OR conversations.recipient_id = ?",
      current_user.id,
      current_user.id
    )

    user_ids = (@conversations.map(&:sender_id) + @conversations.map(&:recipient_id)).uniq
    @users = User.where(id: user_ids)
    @messages= Message.where(id: user_ids)

  end

  def create
    if Conversation.between(params[:sender_id],params[:recipient_id],params[:experience_id]).present?
      @conversation = Conversation.between(params[:sender_id],
      params[:recipient_id], params[:experience_id]).first
   else
      @conversation = Conversation.create!(conversation_params)
   end
    redirect_to conversation_messages_path(@conversation)
  end

  private
   def conversation_params
    params.permit(:sender_id, :recipient_id, :experience_id)
   end
end




