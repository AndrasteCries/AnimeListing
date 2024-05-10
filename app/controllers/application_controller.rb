class ApplicationController < ActionController::Base
  def index
    @users = User.all
    render "pages/main"
  end
end
