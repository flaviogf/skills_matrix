class ApplicationController < ActionController::Base
  private
  def authorize(role=nil)
    return redirect_to new_sessions_path unless current_user.present?

    return unless role.present?

    return redirect_to dashboards_path unless current_user.send(role)
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  helper_method :current_user
end
