class Admin::UsersController < Admin::ApplicationController
  before_action :require_admin!

  def index
    @users = User.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    @projects = @user.projects.order(created_at: :desc)
  end
end
