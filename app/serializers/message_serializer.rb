class MessageSerializer
  include JSONAPI::Serializer
  attributes :id, :content, :reciever_phone_number, :user_id
end
