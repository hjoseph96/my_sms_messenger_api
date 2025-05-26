class Message
  include Mongoid::Document
  include Mongoid::Timestamps

  field :receiver_phone_number, type: String
  field :content, type: String

  belongs_to :user

  after_create :send_sms

  def send_sms
    twilio_sid = Rails.application.credentials.twilio_sid
    twilio_token = Rails.application.credentials.twilio_token
    @client = Twilio::REST::Client.new(twilio_sid, twilio_token)
    @client.messages
           .create(
             body: self.content,
             from: "+1 (718) 307-2924",
             to: self.receiver_phone_number
           )
  end
end
