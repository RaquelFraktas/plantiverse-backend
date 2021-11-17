class ForumTopicSerializer < ActiveModel::Serializer
  attributes :id, :content, :img_url, :title
end
