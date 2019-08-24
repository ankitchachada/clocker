class ClockEventsController < ApplicationController
  before_action :set_clock_entry, only: [:show, :edit, :update, :destroy]

  # GET /clock_events/1/edit
  def edit
  end

  # POST /clock_events
  # POST /clock_events.json
  def create
  	last_entry = current_user.clock_events.last.is_clocked rescue nil
    clock_entry = current_user.clock_events.create(clock_entry_params)
    if last_entry
      clock_entry.is_clocked = false
    else
      clock_entry.is_clocked = true
    end
    if clock_entry.save
   		redirect_to root_path, notice: 'Clock entry was successfully created.' 
 		else
    	redirect_to root_path, notice: 'Something went wrong' 
    end
  end

  # PATCH/PUT /clock_events/1
  # PATCH/PUT /clock_events/1.json
  def update
    respond_to do |format|
      if @clock_entry.update(clock_entry_params)
        format.html { redirect_to @clock_entry, notice: 'Clock entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @clock_entry }
      else
        format.html { render :edit }
        format.json { render json: @clock_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clock_events/1
  # DELETE /clock_events/1.json
  def destroy
    @clock_entry.destroy
    respond_to do |format|
      format.html { redirect_to clock_events_url, notice: 'Clock entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clock_entry
      @clock_entry = ClockEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clock_entry_params
      params.require(:clock_entry).permit(:user_id, :is_clocked,:event_type)
    end
end
