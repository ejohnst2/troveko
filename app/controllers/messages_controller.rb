class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages.order('created_at DESC')
    received_messages = @messages.where.not(user_id: current_user.id)
    if received_messages.any?
      received_messages.each do |r_message|
        r_message.update(read: true)
      end
    end
    @message = Message.new
  end

  def new
    @message = @conversation.messages.new
  end

  def create
   @message = @conversation.messages.new(message_params)
   @message.user_id = current_user.id

   if @message.save
    redirect_to conversation_messages_path(@conversation)
  end

  end

  private
  def message_params
    params.require(:message).permit(:header, :content, :user_id)
  end
end
