class DashboardController < ApplicationController

	def user
		@past_meetings = Meeting.where(:date => 1.month.ago..Date.today - 1.day)

		@today_meetings = Meeting.where(Date.today)

		@future_meetings = Meeting.where(:date => Date.today + 1.day..Date.today + 30.day)
	end

	def admin
	end
end
