class Admin::ShipsController < Admin::ApplicationController
  before_action :set_ship, only: %i[show edit update]

  def index
    @ships = Ship.includes(:project, :reviewer, project: :user).order(created_at: :desc)
  end

  def show
    authorize @ship
  end

  def edit
    authorize @ship
  end

  def update
    authorize @ship

    if @ship.update(ship_params)
      redirect_to admin_ship_path(@ship), notice: "Ship updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_ship
    @ship = Ship.find(params[:id])
  end

  def ship_params
    params.expect(ship: [ :status, :feedback, :justification, :approved_seconds, :reviewer_id ])
  end
end
