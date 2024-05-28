class ForumTagsController < ApplicationController
  before_action :set_forum_tag, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, except: [:index, :show]

  # GET /forum_tags
  def index
    @forum_tags = ForumTag.all
  end

  # GET /forum_tags/1
  def show
  end

  # GET /forum_tags/new
  def new
    @forum_tag = ForumTag.new
  end

  # GET /forum_tags/1/edit
  def edit
  end

  # POST /forum_tags
  def create
    @forum_tag = ForumTag.new(forum_tag_params)

    if @forum_tag.save
      redirect_to @forum_tag, notice: 'Forum tag was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /forum_tags/1
  def update
    if @forum_tag.update(forum_tag_params)
      redirect_to @forum_tag, notice: 'Forum tag was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /forum_tags/1
  def destroy
    @forum_tag.destroy
    redirect_to forum_tags_url, notice: 'Forum tag was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_forum_tag
    @forum_tag = ForumTag.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def forum_tag_params
    params.require(:forum_tag).permit(:name)
  end

  def authorize_user
    unless user_signed_in?
      redirect_to forum_tags_path, alert: 'You are not authorized to perform this action.'
    end
  end
end
