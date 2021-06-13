class DevelopersController < ApplicationController
  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.new(developer_params)

    if @developer.save
      redirect_to new_developer_path, notice: I18n.t('developers.create.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def developer_params
    params.require(:developer).permit(:email)
  end
end
