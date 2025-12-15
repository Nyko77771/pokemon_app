# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_user

  # Returns the currently logged-in user based on the session.
  def current_user
    @current_user = (User.find_by(id: session[:user_id]) if session[:user_id])
  end

  # Checks if a user is logged in
  # If they are not then it redirects them to the login page with an alert.
  def require_user
    return if current_user

    redirect_to '/login', alert: 'You must be logged in'
  end
end
