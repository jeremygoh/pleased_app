class DashboardController < ApplicationController

	def user
		@dashboard = Dashboard.user
	end

	def admin
		@dashboard = Dashboard.admin
	end
end
