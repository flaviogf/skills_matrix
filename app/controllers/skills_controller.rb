class SkillsController < ApplicationController
  before_action { authorize(:admin) }

  before_action :set_skill, only: [:show, :edit, :update]

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

  def show
  end

  def edit
  end

  def update
    if @skill.update(skill_params)
      redirect_to @skill, notice: I18n.t('skills.update.success')
    else
      render :show, status: :unprocessable_entity
    end
  end

  private
  def set_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:name)
  end
end
