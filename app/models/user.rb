class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true
  has_many :user_plants, dependent: :destroy
  has_many :plants, through: :user_plants
  has_many :comments, dependent: :destroy
  has_many :forum_topics, dependent: :destroy
end
