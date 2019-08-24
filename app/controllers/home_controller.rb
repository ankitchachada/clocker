class HomeController < ApplicationController
  def index
  	@clock_events = ClockEvent.where("DATE(created_at) = ?", Date.today).order("created_at desc")
  end
end
