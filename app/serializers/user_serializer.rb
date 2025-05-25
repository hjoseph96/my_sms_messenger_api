class UserSerializer
  include JSONAPI::Serializer

  attributes :id, :email

  attribute :token, &:jti
end
