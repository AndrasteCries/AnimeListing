class ApplicationController < ActionController::Base
  def index
    render "pages/main"
  end
end
