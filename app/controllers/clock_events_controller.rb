class ClockEventsController < ApplicationController
  before_action :set_clock_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authorize, only: [:index ,:edit,:update,:destroy]

  def index
    @clock_events = ClockEvent.order("created_at desc")
  end
  # GET /clock_events/1/edit
  def edit
  end

  # POST /clock_events
  # POST /clock_events.json
  def create
  	last_entry = current_user.clock_events.last.is_clocked rescue nil
    clock_event = current_user.clock_events.create(clock_event_params)
    if last_entry
      clock_event.is_clocked = false
    else
      clock_event.is_clocked = true
    end
    if clock_event.save
   		redirect_to root_path, notice: 'Clock event was successfully created.' 
 		else
    	redirect_to root_path, notice: 'Something went wrong' 
    end
  end

  # PATCH/PUT /clock_events/1
  # PATCH/PUT /clock_events/1.json
  def update
    if @clock_event.update(clock_event_params)
      @clock_event.update_time(clock_event_params)
      redirect_to root_path, notice: 'Clock event was successfully updated.' 
    else
      redirect_to root_path, notice: 'Something went wrong' 
    end
  end


  def destroy
    @clock_event.destroy
    redirect_to clock_events_url, notice: 'Clock event was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clock_event
      @clock_event = ClockEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clock_event_params
      if current_user.role == "admin"
        params.require(:clock_event).permit(:offset,:user_id, :is_clocked,:event_type,:created_at) 
      else
        params.require(:clock_event).permit(:user_id, :is_clocked,:event_type)
      end
    end

    def authorize
      unless current_user.role == "admin"
        redirect_to root_path, notice: 'Please contact Admin'
      end
    end
end
