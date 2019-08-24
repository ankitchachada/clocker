class ClockEvent < ApplicationRecord
	belongs_to :user
	scope :today, lambda {where("DATE(created_at) = ?", Date.today)}
	scope :desc, lambda {order("created_at desc")}
end
