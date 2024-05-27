class TopicCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic

  def create
    @comment = @topic.topic_comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @topic, notice: 'Комментарий успешно добавлен.'
    else
      redirect_to @topic, alert: 'Не удалось добавить комментарий.'
    end
  end

  private

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def comment_params
    params.require(:topic_comment).permit(:text)
  end
end
