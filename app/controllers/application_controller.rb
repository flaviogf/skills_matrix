class ApplicationController < ActionController::Base
  private
  def authorize(role)
    return redirect_to new_session_path unless current_user.present?

    return head :forbidden unless current_user.role == Role.admin
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
