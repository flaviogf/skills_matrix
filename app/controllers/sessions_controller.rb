class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new session_params

    if (user = @session.authenticate)
      session[:current_user_id] = user.id

      redirect_to user_profiles_path
    else
      flash[:error] = 'Invalid email or password'

      render :new, status: :unauthorized
    end
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
