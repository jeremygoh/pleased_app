class DashboardController < ApplicationController
before_filter :authenticate_user!

	def user

    if current_user.is_admin?
      all_past_meetings = Meeting.where(:date => 3.months.ago..Date.today - 1.day)

      @all_notifications = []

      all_past_meetings.each do |meeting|
        Patient.all.each do |patient|
          if (Attend.where(:patient_id => patient.id, :meeting_id => meeting.id).empty? || Attend.where(:patient_id => patient.id, :meeting_id => meeting.id).first.attended == false) || Attend.where(:patient_id => patient.id, :meeting_id => meeting.id).first.checked!=true
            @all_notifications << [patient.id, meeting.id]
          end
        end
      end


    elsif current_user.health_pro?
      all_past_meetings = Meeting.where(:date => 3.months.ago..Date.today - 1.day)

      @all_notifications = []

      all_past_meetings.each do |meeting|

        Patient.all.each do |patient|
          if (Attend.where(:patient_id => patient.id, :meeting_id => meeting.id).empty? || Attend.where(:patient_id => patient.id, :meeting_id => meeting.id).first.attended == false) || Attend.where(:patient_id => patient.id, :meeting_id => meeting.id).first.checked!=true

            @all_notifications << [patient.id, meeting.id]
          end
        end
      end

        @past_meetings = Meeting.where(:date => 3.month.ago..Date.today - 1.day).limit(10)

        @today_meetings = Meeting.where(:date => Date.today.beginning_of_day..Date.today.end_of_day)

        @future_meetings = Meeting.where(:date => Date.today + 1.day..Date.today + 30.day)


    else
        unless current_user.group_id.nil?
          user_group = Group.find(current_user.group_id)

        		@past_meetings = user_group.meetings.where(:date => 3.months.ago..Date.today - 1.day).limit(10)

        		@today_meetings = user_group.meetings.where(:date => Date.today.beginning_of_day..Date.today.end_of_day)

        		@future_meetings = user_group.meetings.where(:date => Date.today + 1.day..Date.today + 30.day)


            @notifications = []
            @past_meetings.each do |meeting|
              user_group.patients.each do |patient|
                if (Attend.where(:patient_id => patient.id, :meeting_id => meeting.id).empty? || Attend.where(:patient_id => patient.id, :meeting_id => meeting.id).first.attended == false) || Attend.where(:patient_id => patient.id, :meeting_id => meeting.id).first.checked!=true
                  @notifications << [patient.id, meeting.id]
                end
              end
            end

        end
    end
	end

end
