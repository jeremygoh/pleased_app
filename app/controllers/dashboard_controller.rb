class DashboardController < ApplicationController

	def user
		@past_meetings = Meeting.where(:date => 1.month.ago..Date.today - 1.day)

		@today_meetings = Meeting.where('start BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day)

		@future_meetings = Meeting.where(:date => Date.today + 1.day..Date.today + 30.day)
	end

	def admin
	end
end
