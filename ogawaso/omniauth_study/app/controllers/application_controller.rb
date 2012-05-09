class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :reset_session_expires

  private

  def reset_session_expires
    request.session_options[:expire_after] = 2.weeks
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  helper_method :current_user
end
