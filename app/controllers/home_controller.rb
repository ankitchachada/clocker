class HomeController < ApplicationController
  def index
  	@clock_events = ClockEvent.order('created_at desc')
  end
end
