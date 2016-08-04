class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  #current_user to return the current user.
  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  #logged_in? to return a boolean indicating whether someone is signed in.
  def logged_in?
    !current_user.nil?
  end

  #log_in_user!(user) reset the users session token and cookie
  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  #log_out_user!(user)
  def log_out_user!(user)
    user.reset_session_token!
    session[:session_token] = nil
  end

  private

  def require_no_user!
    redirect_to user_url(current_user) if current_user
  end
end
