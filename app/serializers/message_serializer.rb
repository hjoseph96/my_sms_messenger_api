class MessageSerializer
  include JSONAPI::Serializer
  attributes :id, :content, :receiver_phone_number, :user_id
end
