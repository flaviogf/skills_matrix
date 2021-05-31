class SkillsController < ApplicationController
  http_basic_authenticate_with name: ENV['APP_USER'], password: ENV['APP_PASS']

  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  def index
    @skills = Skill.all
  end

  def show
  end

  def new
    @skill = Skill.new
  end

  def edit
  end

  def create
    @skill = Skill.create skill_params

    if @skill.save
      respond_to do |format|
        format.html { redirect_to edit_skill_path(@skill) }
        format.json { render json: @skill, status: :created, location: @skill }
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
        format.html { redirect_to edit_skill_path(@skill) }
        format.json { render :show, status: :ok, location: @skill }
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @skill.destroy

    respond_to do |format|
      format.html { redirect_to skills_path }
      format.json { head :no_content }
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
