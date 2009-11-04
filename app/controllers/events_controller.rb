class EventsController < ApplicationController
  before_filter :fetch_event, :only => [:edit, :update, :destroy]

  def new
    @event = Event.new()
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      flash[:notice] = "Success added"
      redirect_to events_path
    else
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @event.update_attributes(params[:event])
      flash[:notice] = "Successfully editted"
      redirect_to events_path
    else
      render :action => "edit"
    end
  end

  def index
    @events = Event.all
  end

  def destroy
    @event.destroy
    flash[:notice] = "Successfully destroyed"
    redirect_to events_path
  end

  private

  def fetch_event
    @event = Event.find(params[:id])
  end
end
