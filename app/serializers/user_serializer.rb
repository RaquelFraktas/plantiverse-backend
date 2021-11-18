class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :plants
  has_many :plants
  has_many :forum_topics
  has_many :comments
  has_many :user_plants
  has_many :plants, :through => :user_plants
end
