class Api::V1::MessagesController < ApplicationController
  def index
    render json: {
      status: { code: 200, message: "Signed up successfully." },
      data: MessageSerializer.new(current_user.messages).serializable_hash[:data][:attributes]
    }
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user

    if @message.save
      render json: {
        status: { code: 200, message: "Signed up successfully." },
        data: MessageSerializer.new(@message).serializable_hash[:data][:attributes]
      }
    else
      render json: { error: @message.errors.full_messages.join(", ") }, status: :unprocessable_content
    end
  end

  private

  def message_params
    params.require(:message).permit(:receiver_phone_number, :content)
  end
end
