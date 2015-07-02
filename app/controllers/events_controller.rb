class EventsController < ApplicationController
  before_action :set_event, :only => [ :show, :edit, :update, :destroy]

  def index
    @events = Event.page(params[:page]).per(4)

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @events.to_xml }
      format.json { render :json => @events.to_json }
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      # redirect_to :action => :index
      redirect_to events_url
      flash[:notice] = "event was successfully created"
    else
      render :action => :new
    end
  end

  def show
    @event = Event.find(params[:id])
    respond_to do |format|
      format.html { @page_title = @event.name } # show.html.erb
      format.xml # show.xml.builder
      format.json { render :json => { id: @event.id, name: @event.name }.to_json }
    end
  end

  def edit
      @event = Event.find(params[:id])
  end

  def update
    if @event.update(event_params)
      # redirect_to :action => :show, :id => @event
      redirect_to event_url(@event)
      flash[:notice] = "event was successfully updated"
    else
      render :action => :edit
    end
  end

  def destroy
    @event.destroy
    # redirect_to :action => :index
    redirect_to events_url
  end


private
  def event_params
      params.require(:event).permit(:name, :description)
  end

  def set_event
      @event = Event.find(params[:id])
  end
end
