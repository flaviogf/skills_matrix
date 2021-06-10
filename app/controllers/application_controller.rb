class ApplicationController < ActionController::Base
  private
  def authenticate!
    redirect_to new_session_path unless user_signed_in?
  end

  def user_signed_in?
    session[:current_user_id].present?
  end

  def current_user
    @_current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end
end
