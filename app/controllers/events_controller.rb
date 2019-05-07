class EventsController < ApplicationController
  def index
    @page_title = "Bienvenue"
    @events = Event.all
  end

  def new
    @page_title = "Ajouter un event"
    @event = Event.new
  end
end
