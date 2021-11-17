class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true
  has_many :user_plants
  has_many :plants, :through => :user_plants
  has_many :comments
  has_many :forum_topics
end
