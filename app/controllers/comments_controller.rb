class CommentsController < ApplicationController

  def index
    # forum_topic = ForumTopic.find(params[:forum_topic_id])
    # comments = forum_topic.comments.all
    # render json: forum_topic
    comments = Comment.all
    render json: comments
  end

  def create
    comment = Comment.new(comment_forum_params)
    if comment.save
      # byebug
      render json: comment
    else
      render json:{errors: comment.errors.full_messages.to_sentence}, status: :unprocessable_entity
    end
  end



  private
  def comment_forum_params
    params.permit(:content, :user_id, :forum_topic_id)
  end

end
