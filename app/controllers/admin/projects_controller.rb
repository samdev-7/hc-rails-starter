class Admin::ProjectsController < Admin::ApplicationController
  before_action :require_admin!

  def index
    @projects = Project.includes(:user).order(created_at: :desc)
  end

  def show
    @project = Project.find(params[:id])
    @ships = @project.ships.includes(:reviewer).order(created_at: :desc)
  end
end
