class ForumTopicSerializer < ActiveModel::Serializer
  attributes :id, :content, :img_url, :title
  belongs_to :user
  has_many :comments
end
