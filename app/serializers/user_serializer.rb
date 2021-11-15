class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :plants
  has_many :plants
end
