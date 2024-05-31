class AnimesController < ApplicationController
  before_action :set_anime, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin, only: [:new, :create, :edit, :update, :destroy]
  # GET /animes
  # GET /animes.json
  def index
    @animes = Anime.all
  end

  # GET /animes/1
  # GET /animes/1.json
  def show
    @comments = @anime.comments.order(created_at: :desc)
  end

  # GET /animes/new.html.erb
  def new
    @anime = Anime.new
    @tags = Tag.all
    @types = Type.all
    @genres = Genre.all
  end

  # GET /animes/1/edit
  def edit
    @tags = Tag.all
    @types = Type.all
    @genres = Genre.all
  end

  # POST /animes
  # POST /animes.json
  def create
    @anime = Anime.new(anime_params)

    respond_to do |format|
      if @anime.save
        format.html { redirect_to @anime, notice: 'Anime was successfully created.' }
        format.json { render :show, status: :created, location: @anime }
      else
        format.html { render :new }
        format.json { render json: @anime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animes/1
  def update
    respond_to do |format|
      begin
        # Обновление основной записи
        if @anime.update(anime_params)
          # Логи для отладки обновления
          Rails.logger.debug("Anime main attributes updated successfully")

          # Обновление связей
          update_associations

          format.html { redirect_to @anime, notice: 'Anime was successfully updated.' }
          format.json { render :show, status: :ok, location: @anime }
        else
          @tags = Tag.all
          @types = Type.all
          @genres = Genre.all

          # Логи ошибок
          Rails.logger.debug("Anime update failed: #{@anime.errors.full_messages.join(", ")}")

          format.html { render :edit }
          format.json { render json: @anime.errors, status: :unprocessable_entity }
        end
      rescue StandardError => e
        Rails.logger.error("Error updating anime: #{e.message}")
        format.html { redirect_to @anime, alert: 'Error updating anime.' }
        format.json { render json: { error: 'Error updating anime.' }, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animes/1
  # DELETE /animes/1.json
  def destroy
    @anime.destroy
    respond_to do |format|
      format.html { redirect_to animes_url, notice: 'Anime was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def update_associations
    @anime.tags.clear
    @anime.types.clear
    @anime.genres.clear

    @anime.tags = Tag.where(id: params[:anime].fetch(:tag_ids, []).reject(&:blank?))
    @anime.types = Type.where(id: params[:anime].fetch(:type_ids, []).reject(&:blank?))
    @anime.genres = Genre.where(id: params[:anime].fetch(:genre_ids, []).reject(&:blank?))

    Rails.logger.debug("Anime associations updated with tags: #{@anime.tags.pluck(:id)}, types: #{@anime.types.pluck(:id)}, genres: #{@anime.genres.pluck(:id)}")
  end

  def set_anime
    @anime = Anime.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def anime_params
    params.require(:anime).permit(:name, :description, :episodes, :duration, :score,
                                  :popularity, :rating, :yrating, :studio_id, :status, :title_image,
                                  tag_ids: [], type_ids: [], genre_ids: [])
  end

  def authorize_admin
    unless current_user&.admin?
      respond_to do |format|
        format.html { redirect_to animes_path, alert: 'You are not authorized to perform this action.' }
        format.json { render json: { error: 'Not Authorized' }, status: :forbidden }
      end
    end
  end

end
