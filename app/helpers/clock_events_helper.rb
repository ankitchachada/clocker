module ClockEventsHelper
	def clock_button
    unless current_user.nil?
    	unless current_user.clock_events.last.nil?
    		current_user.clock_events.last.is_clocked ? "Clock Out" : "Clock In"
      else
      	"Clock In"
      end
  	end
  end

  def is_clocked(user)
  	user.is_clocked ? "Clocked In" : "Clocked Out"
  end

  def all_events
    if current_user.role == "admin"
      link_to('All Clocked Events', clock_events_path, class: "btn btn-primary" )     
    end
  end
  
end
