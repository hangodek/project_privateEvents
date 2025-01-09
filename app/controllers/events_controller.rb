class EventsController < ApplicationController
  def index
    if authenticated?
      current_user_email = Current.user.email_address
      user = User.find_by(email_address: current_user_email)
      @hosting_events = user.hosting_events.all
      @attending_events = user.attending_events.all
    end
  end

  def new
  end

  def create
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end
end
