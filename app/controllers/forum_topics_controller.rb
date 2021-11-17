class ForumTopicsController < ApplicationController

  def index
    forum_topics = ForumTopic.all
    render json: forum_topics
  end

end
