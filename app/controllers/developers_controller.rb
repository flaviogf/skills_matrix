class DevelopersController < ApplicationController
  before_action :authorize, only: [:index]
  before_action :set_developer, only: [:destroy]

  def index
    @developers = Developer.all
  end

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

  def destroy
    @developer.destroy

    redirect_to developers_path
  end

  private
  def set_developer
    @developer = Developer.find(params[:id])
  end

  def developer_params
    params.require(:developer).permit(:email, developer_skills_attributes: [:skill_id, :points])
  end
end
