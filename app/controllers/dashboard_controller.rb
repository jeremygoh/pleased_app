class DashboardController < ApplicationController
before_filter :authenticate_user!

	def user
    unless current_user.group_id.nil?
      user_group = Group.find(current_user.group_id)

    		@past_meetings = user_group.meetings.where(:date => 1.month.ago..Date.today - 1.day)

    		@today_meetings = user_group.meetings.where(:date => Date.today.beginning_of_day..Date.today.end_of_day)

    		@future_meetings = user_group.meetings.where(:date => Date.today + 1.day..Date.today + 30.day)


        @notifications = []
        @past_meetings.each do |meeting|
          user_group.patients.each do |patient|
            if Attend.where(:patient_id => patient.id, :meeting_id => meeting.id).empty? || Attend.where(:patient_id => patient.id, :meeting_id => meeting.id).first.attended
              @notifications << [patient.id, meeting.id]
            end
          end
        end

    end
	end

	def admin
	end
end
