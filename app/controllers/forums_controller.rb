class ForumsController < ApplicationController
  before_action :set_forum, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin, only: [:new, :create, :edit, :update, :destroy]

  # GET /fromums
  # GET /fromums.json
  def index
    @forums = Forum.all
  end

  # GET /fromums/1
  # GET /fromums/1.json
  def show
    @topics = @forum.topics.order(created_at: :desc)
  end

  # GET /fromums/new
  def new
    @forum = Forum.new
  end

  # GET /fromums/1/edit
  def edit
  end

  # POST /fromums
  # POST /fromums.json
  def create
    @forum = Forum.new(forums_params)

    respond_to do |format|
      if @forum.save
        format.html { redirect_to @forum, notice: 'Forum was successfully created.' }
        format.json { render :show, status: :created, location: @forum }
      else
        format.html { render :new }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fromums/1
  # PATCH/PUT /fromums/1.json
  def update
    respond_to do |format|
      if @forum.update(topic_params)
        format.html { redirect_to @forum, notice: 'Forum was successfully updated.' }
        format.json { render :show, status: :ok, location: @forum }
      else
        format.html { render :edit }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fromums/1
  # DELETE /fromums/1.json
  def destroy
    @forum.destroy
    respond_to do |format|
      format.html { redirect_to forums_path, notice: 'Forum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_forum
    @forum = Forum.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def forums_params
    params.require(:forum).permit(:title, :position) # Add any other permitted attributes here
  end

  def authorize_user
    unless user_signed_in?
      respond_to do |format|
        format.html { redirect_to forum_path, alert: 'You are not authorized to perform this action.' }
        format.json { render json: { error: 'Not Authorized' }, status: :forbidden }
      end
    end
  end
end
