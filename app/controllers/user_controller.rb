class UserController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  def show
    @animes = Anime.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image,
                                 :nickname, :birthday, :sex, :location, :about)
  end


end