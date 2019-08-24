class HomeController < ApplicationController
  def index
  	@clock_events = ClockEvent.all
  end
end
