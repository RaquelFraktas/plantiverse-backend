class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :forum_topic_id, :content
  belongs_to :user
  belongs_to :forum_topic
end
