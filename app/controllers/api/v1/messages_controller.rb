class Api::V1::MessagesController < ApplicationController
  def index
    render json: current_user.messages
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user

    if @message.save
      render json: @message
    else
      render json: { error: @message.errors.full_messages.join(", ") }
    end
  end

  private

  def message_params
    params.require(:message).permit(:receiver_phone_number, :content)
  end
end
