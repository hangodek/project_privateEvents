class HomepagesController < ApplicationController
  allow_unauthenticated_access only: %i[ index ]

  def index
    if authenticated?
      current_user_email = Current.user.email_address
      user = User.find_by(email_address: current_user_email)
      @hosting_events = user.hosting_events.all
      @attending_events = user.attending_events.all
    end
  end
end
