class SkillsController < ApplicationController
  before_action :authorize

  def index
    @skills = Skill.all
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)

    if @skill.save
      redirect_to @skill, notice: I18n.t('skills.create.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def skill_params
    params.require(:skill).permit(:name)
  end
end
