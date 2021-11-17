class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :forumtopic_id, :content
  has_many :users
  belongs_to :forum_topic
end
