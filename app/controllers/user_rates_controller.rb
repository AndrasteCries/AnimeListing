class UserRatesController < ApplicationController
  before_action :set_user_rate, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :new, :update, :destroy]

  def index
    @user_rates = UserRate.all
  end

  def show
  end

  def new
    @user_rate = UserRate.new
  end

  def create
    @user_rate = UserRate.new(user_rate_params)
    if user_already_rated_anime?
      flash[:alert] = "You have already rated this anime."
      redirect_to root_path
    else
      respond_to do |format|
        if @user_rate.save
          format.html { redirect_to user_profile_path(@user_rate.user_id), notice: 'User rate was successfully created.' }
          format.turbo_stream
        else
          format.html { redirect_to root_path, alert: @user_rate.errors.full_messages.join(", ") }
        end
      end
    end
  end

  def edit
  end

  def update
    if @user_rate.update(user_rate_params)
      redirect_to user_profile_path(@user_rate.user_id), notice: 'User rate was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user_rate.destroy
    redirect_to user_profile_path(@user_rate.user_id), notice: 'User rate was successfully destroyed.'
  end

  private

  def user_already_rated_anime?
    UserRate.exists?(user_id: @user_rate.user_id, anime_id: @user_rate.anime_id)
  end

  def set_user_rate
    @user_rate = UserRate.find(params[:id])
  end

  def user_rate_params
    params.require(:user_rate).permit(:anime_id, :score, :status, :user_id)
  end

  def authorize_user
    unless current_user?
      respond_to do |format|
        format.html { redirect_to root_path, alert: 'You are not authorized to perform this action.' and return }
        format.json { render json: { error: 'Not Authorized' }, status: :forbidden and return }
      end
    end
  end
end