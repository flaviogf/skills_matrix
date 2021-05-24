class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :edit, :update]

  def index
    @skills = Skill.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @skill = Skill.create skill_params

    if @skill.save
      respond_to do |format|
        format.html { redirect_to skill_path(@skill) }
        format.json { render json: @skill, location: skill_path(@skill), status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @skill.update(skill_params)
      respond_to do |format|
        format.html { redirect_to skill_path(@skill) }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_skill
    @skill = Skill.find params[:id]
  rescue
    head :not_found
  end

  def skill_params
    params.require(:skill).permit(:name)
  end
end
