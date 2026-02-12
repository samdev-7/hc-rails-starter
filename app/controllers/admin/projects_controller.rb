class Admin::ProjectsController < Admin::ApplicationController
  before_action :require_admin!

  def index
    scope = Project.includes(:user)
    scope = scope.search(params[:query]) if params[:query].present?
    @pagy, @projects = pagy(scope.order(created_at: :desc))
  end

  def show
    @project = Project.find(params[:id])
    @ships = @project.ships.includes(:reviewer).order(created_at: :desc)
  end
end
