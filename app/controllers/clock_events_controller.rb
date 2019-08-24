class ClockEventsController < ApplicationController
  before_action :set_clock_event, only: [:show, :edit, :update, :destroy]

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
   		redirect_to root_path, notice: 'Clock entry was successfully created.' 
 		else
    	redirect_to root_path, notice: 'Something went wrong' 
    end
  end

  # PATCH/PUT /clock_events/1
  # PATCH/PUT /clock_events/1.json
  def update
    respond_to do |format|
      if @clock_event.update(clock_event_params)
        format.html { redirect_to @clock_event, notice: 'Clock entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @clock_event }
      else
        format.html { render :edit }
        format.json { render json: @clock_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clock_events/1
  # DELETE /clock_events/1.json
  def destroy
    @clock_event.destroy
    respond_to do |format|
      format.html { redirect_to clock_events_url, notice: 'Clock entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clock_event
      @clock_event = ClockEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clock_event_params
      params.require(:clock_event).permit(:user_id, :is_clocked,:event_type)
    end
end
