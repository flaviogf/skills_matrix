class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)

    return render :new, status: :unprocessable_entity unless @session.valid?

    user = User.find_by(email: @session.email)

    return render :new, status: :unprocessable_entity unless user&.authenticate(@session.password)

    session[:user_id] = user.id

    redirect_to user, notice: I18n.t('sessions.create.success')
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
