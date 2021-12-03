class ForumTopic < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments
  
  validates_format_of :img_url,
    :with    => %r{\.(gif|jpe?g|png)$}i,
    :message => "Must have an image extension",
    :multiline => true,
    :allow_blank=> true

end
