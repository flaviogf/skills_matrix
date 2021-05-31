class TeamsController < ApplicationController
  http_basic_authenticate_with name: ENV['APP_USER'], password: ENV['APP_PASS']

  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def show
  end

  def new
    @team = Team.new
  end

  def edit
  end

  def create
    @team = Team.new team_params

    if @team.save
      respond_to do |format|
        format.html { redirect_to edit_team_path(@team) }
        format.json { render json: @body, location: @body, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @team.update(team_params)
      respond_to do |format|
        format.html { redirect_to edit_team_path(@team) }
        format.json { render :show, status: :ok, location: @team }
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_path }
      format.json { head :no_content }
    end
  end

  private
  def set_team
    @team = Team.find params[:id]
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  def team_params
    params.require(:team).permit(:name)
  end
end
