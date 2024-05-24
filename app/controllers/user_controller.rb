class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    @animes = Anime.all
  end

end