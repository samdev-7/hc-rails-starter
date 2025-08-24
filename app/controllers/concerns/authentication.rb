# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
    helper_method :authenticated?
  end

  class_methods do
    def allow_unauthenticated_access(only: nil)
      skip_before_action :authenticate_user!, only: only
    end
  end

  private

  def authenticate_user!
    set_current_user
    unless Current.user
      redirect_to new_session_path, alert: "You need to be logged in to see this!"
    end
  end

  def authenticated?
    Current.user.present?
  end

  def set_current_user
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def terminate_session
    reset_session
  end
end
