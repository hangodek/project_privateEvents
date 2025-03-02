class HomepagesController < ApplicationController
  allow_unauthenticated_access only: %i[ index ]

  def index
    if authenticated?
      @user = Current.user
      @events = Event.all
    end
  end
end
