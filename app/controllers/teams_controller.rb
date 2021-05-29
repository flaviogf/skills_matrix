class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit]

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

  private
  def set_team
    @team = Team.find params[:id]
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end
end
