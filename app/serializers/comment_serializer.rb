class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :forumtopic_id, :content
end
