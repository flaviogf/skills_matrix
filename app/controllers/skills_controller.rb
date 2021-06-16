class SkillsController < ApplicationController
  before_action :authorize
  before_action :set_skill, only: [:edit, :update, :destroy]

  def index
    @skills = Skill.includes(:developer_skills)

    respond_to do |format|
      format.html
      format.json { render json: @skills, include: [:developer_skills] }
    end
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)

    if @skill.save
      redirect_to skills_path, notice: I18n.t('skills.create.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @skill.update(skill_params)
      redirect_to skills_path, notice: I18n.t('skills.update.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @skill.destroy!

    redirect_to skills_path
  end

  private
  def set_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:name)
  end
end
