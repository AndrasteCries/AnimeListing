class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :redirect_to_locale
  def index
    @latest_animes = Anime.order(created_at: :desc).limit(5)
    @latest_characters = Character.order(created_at: :desc).limit(5)
    @latest_topics = Topic.order(created_at: :desc).limit(5)
    @latest_comments = Comment.order(created_at: :desc).limit(5)
    @genres = Genre.all
    @def_local = I18n.locale
    render "pages/main"
  end

  private

  def redirect_to_locale
    if request.path == "/" && !params[:locale].present?
      redirect_to root_path(locale: "en")
    end
  end
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  def default_url_options
    {locale: I18n.locale}
  end
end
