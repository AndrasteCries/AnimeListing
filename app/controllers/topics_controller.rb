class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:new, :create, :edit, :update, :destroy]

  # GET /topics
  def index
    @topics = Topic.all
  end

  # GET /topics/1
  def show
    @comments = @topic.topic_comments.order(created_at: :desc)
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics
  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_topic
    @topic = Topic.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def topic_params
    params.require(:topic).permit(:title, :body, :forum_id, :image, forum_tag_ids: [])
  end

  def authorize_user
    unless user_signed_in?
      respond_to do |format|
        format.html { redirect_to topics_path, alert: 'You are not authorized to perform this action.' }
        format.json { render json: { error: 'Not Authorized' }, status: :forbidden }
      end
    end
  end
end
