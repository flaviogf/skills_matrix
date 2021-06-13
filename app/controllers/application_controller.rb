class ApplicationController < ActionController::Base
  private
  def authorize
    redirect_to new_sessions_path unless current_user.present?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  helper_method :current_user
end
