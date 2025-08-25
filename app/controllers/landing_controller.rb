class LandingController < ApplicationController
  allow_unauthenticated_access only: %i[index]

  def index
    if user_authenticated?
      # Render a different view or perform an action for authenticated users
    end
    # This will render app/views/landing/index.html.erb by default
  end
end
