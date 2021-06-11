class UsersController < ApplicationController
  def new
    @user = Role.staff.users.new
  end

  def create
    @user = Role.staff.users.new(user_params)

    if @user.save
      redirect_to @user, notice: I18n.t('users.create.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
