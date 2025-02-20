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
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.hoster = Current.user

    if @event.save
      redirect_to events_path
    else
      redirect_to events_path
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.expect(event: [ :name, :description, :location ])
  end
end
