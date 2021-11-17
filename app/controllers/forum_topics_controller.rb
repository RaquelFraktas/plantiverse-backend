class ForumTopicsController < ApplicationController

  def index
    forum_topics = ForumTopics.all
    render json: forum_topics
  end

end
