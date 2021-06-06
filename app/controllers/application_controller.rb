class ApplicationController < ActionController::Base
  private
  def authenticate!
    redirect_to new_session_path unless user_signed_in?
  end

  def user_signed_in?
    current_user
  end

  def current_user
    @_current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end
end
