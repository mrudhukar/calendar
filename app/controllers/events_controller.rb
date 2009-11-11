class EventsController < ApplicationController
  before_filter :fetch_event, :only => [:edit, :update, :destroy, :show]

  def new
    @event = Event.new()
    @type_strings = Type.all(:order => "position ASC").collect{|t| [t.label, t.id]}
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      flash[:notice] = "Success added"
      redirect_to new_event_path
    else
      render :action => "new"
    end
  end

  def show
    render :layout => false
  end

  def edit
    @type_strings = Type.all(:order => "position ASC").collect{|t| [t.label, t.id]}
    render :layout => false
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
    @types = Type.all(:order => "position ASC")
    @from_year = params[:from_year].blank? ? 1947 : params[:from_year].to_i
    @to_year = params[:to_year].blank? ? 2009 : params[:to_year].to_i
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
