class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
    else
      @current_user= nil
    end
  end

  def require_user
    unless current_user
      redirect_to '/login', alert: "You must be logged in"
    end
  end

end
