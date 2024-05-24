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
  end

  # GET /animes/new.html.erb
  def new
    @anime = Anime.new
  end

  # GET /animes/1/edit
  def edit
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
  # PATCH/PUT /animes/1.json
  def update
    respond_to do |format|
      if @anime.update(anime_params)
        format.html { redirect_to @anime, notice: 'Anime was successfully updated.' }
        format.json { render :show, status: :ok, location: @anime }
      else
        format.html { render :edit }
        format.json { render json: @anime.errors, status: :unprocessable_entity }
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
  # Use callbacks to share common setup or constraints between actions.
  def set_anime
    @anime = Anime.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def anime_params
    params.require(:anime).permit(:name, :description, :episodes, :duration, :score,
                                  :popularity, :rating, :yrating, :studio_id, :status, :title_image)
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
