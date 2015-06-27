class EventsController < ApplicationController
  
  def new
    @registered_application = RegisteredApplication.find(params[:registered_application_id])
    @event = Event.new
    @event.registered_application = @registered_application
    @registered_application.user = @user
    authorize @event
  end

  def create
  end

  def show
    @event = Event.find
    @registered_application = RegisteredApplication.find(params[:registered_application_id])
    @registered_application.user = @user
    authorize @event
  end

  def destroy
  end


end
