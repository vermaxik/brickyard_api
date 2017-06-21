class UserSerializer < ActiveModel::Serializer
  attributes :id, :login, :role, :token
  belongs_to :main
end
