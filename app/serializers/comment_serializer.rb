class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :username
  # belongs_to :user
  # belongs_to :forum_topic

  def username
    self.object.user.username
  end

  # def forum_topic
  # end


end
