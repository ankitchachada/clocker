class ClockEvent < ApplicationRecord
	belongs_to :user
	scope :today, lambda {
		now = Time.now
		where("created_at between :start and :end", :start => now.beginning_of_day, :end   => now.end_of_day)
	}
	scope :desc, lambda {order("created_at desc")}
end
