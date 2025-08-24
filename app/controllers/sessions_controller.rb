class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
  end

  def create
  end

  def destroy
    terminate_session
    redirect_to root_path, notice: "Signed out successfully. Cya!"
  end
end
