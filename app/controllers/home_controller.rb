class HomeController < ApplicationController
  def index
  	@clock_events = ClockEvent.today.desc
  end
end
