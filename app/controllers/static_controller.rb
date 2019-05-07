class StaticController < ApplicationController
  def welcome
    @events = Event.all
    @users = User.all
    @page_title = "Welcome"
  end
end
