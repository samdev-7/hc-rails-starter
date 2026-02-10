class ApplicationController < ActionController::Base
  include Authentication

  before_action :track_ahoy_visit

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def track_ahoy_visit
    if user_signed_in? && ahoy.visit && ahoy.visit.user_id != current_user.id
      ahoy.visit.update(user_id: current_user.id)
    end

    ahoy.authenticate(current_user) if user_signed_in?
  end
end
