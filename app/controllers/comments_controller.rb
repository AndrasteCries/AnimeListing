class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_anime

  def create
    @comment = @anime.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @anime, notice: 'Комментарий успешно добавлен.'
    else
      redirect_to @anime, alert: 'Не удалось добавить комментарий.'
    end
  end

  private

  def set_anime
    @anime = Anime.find(params[:anime_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
