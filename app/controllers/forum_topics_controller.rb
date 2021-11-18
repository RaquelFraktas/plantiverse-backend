class ForumTopicsController < ApplicationController

  def index
    forum_topics = ForumTopic.all
    render json: forum_topics
  end

  def show
    forum_topic = ForumTopic.find(params[:id])
    render json: forum_topic
  end

  def create
    forum_topic = ForumTopic.new(forum_params)
    if forum_topic.save
      render json: {forum_topic: ForumTopicSerializer.new(forum_topic)} 
    else
      render json:{errors: forum_topic.errors.full_messages.to_sentence}, status: :unprocessable_entity
    end
  end

  private
  def forum_params
    params.permit(:title, :content, :img_url, :user_id)
  end

end
