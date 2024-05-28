class CharactersController < ApplicationController

  before_action :authorize_user, only: [:edit, :new, :update, :destroy]
  def index
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @character = Character.new
    @animes = Anime.all
  end

  def create
    @character = Character.new(character_params)

    respond_to do |format|
      if @character.save
        format.html { redirect_to @character, notice: 'Character was successfully created.'}
        format.json { render :show, status: :created, location: @character }
      else
        format.html { render :new }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @character = Character.find(params[:id])
    @animes = Anime.all
  end

  def update
    @character = Character.find(params[:id])
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to @character, notice: 'Character was successfully updated.' }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    redirect_to characters_url, notice: 'Character was successfully destroyed.'
  end

  private

  def authorize_user
    unless current_user.admin?
      respond_to do |format|
        format.html { redirect_to root_path, alert: 'You are not authorized to perform this action.' and return }
        format.json { render json: { error: 'Not Authorized' }, status: :forbidden and return }
      end
    end
  end

  def character_params
    params.require(:character).permit(:name, :japanese, :full_name, :description, :image, anime_ids: [])
  end
end
