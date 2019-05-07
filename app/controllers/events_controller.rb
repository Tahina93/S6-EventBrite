class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all.order('start_date')
    @page_title = "Bienvenue"
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @page_title = Event.find(params[:id]).title
  end

  # GET /events/new
  def new
    @event = Event.new
    @page_title = "Ajouter un événement"
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @page_title = "Editer \"#{@event.title}\""
  end

  # POST /events
  # POST /events.json
  def create
    puts "asticot"
    puts current_user
    #event_params[:admin] = current_user
    #event_params.merge!({admin: current_user})
    #params.require(:admin).permit(:admin).merge(admin: current_user)
    puts event_params
    @event = Event.new(start_date:params[:start_date], duration:params[:duration], title:params[:title], description:params[:description], price:params[:price], location:params[:location], admin:current_user)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :admin)
    end
end
