class ClockEvent < ApplicationRecord
	belongs_to :user
	attr_accessor :offset
	#after_update :update_time
	scope :today, lambda {
		now = Time.now
		where("created_at between :start and :end", :start => now.beginning_of_day, :end   => now.end_of_day)
	}
	scope :desc, lambda {order("created_at desc")}

	def update_time(params)
		self.created_at = DateTime.parse(params["created_at"]).to_time  + params["offset"].to_i.hours
		self.save
	end
end
