class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :plants
  has_many :plants
  has_many :forum_topics
  has_many :comments
end
