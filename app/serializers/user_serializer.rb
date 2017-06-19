class UserSerializer < ActiveModel::Serializer
  attributes :id, :login, :role, :token
end
