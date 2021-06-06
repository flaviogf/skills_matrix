class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if (@user = User.find_by(email: session_params[:email])) && @user.authenticate(session_params[:password])
      session[:current_user_id] = @user.id

      redirect_to user_profiles_path
    else
      @user = User.new(email: session_params[:email])

      flash[:error] = 'Invalid email or password'

      render :new, status: :unauthorized
    end
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end
end
