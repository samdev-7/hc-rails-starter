class Admin::UsersController < Admin::ApplicationController
  before_action :require_admin!

  def index
    scope = User.all
    scope = scope.search(params[:query]) if params[:query].present?
    @pagy, @users = pagy(scope.order(created_at: :desc))
  end

  def show
    @user = User.find(params[:id])
    @projects = @user.projects.order(created_at: :desc)
  end
end
