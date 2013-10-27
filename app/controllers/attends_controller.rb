class AttendsController < ApplicationController
  def index
    @meeting = Meeting.find(params[:meeting_id])
  end

  def create
    attend = Attend.new(attend_params)
    if attend.save
      redirect_to "/dashboard"
    end
  end

  def update
    patient_id = params[:attend][:patient_id]
    patient = Patient.find(patient_id)
    meeting_id = params[:attend][:meeting_id]
    attend_record = Attend.where(:patient_id => patient.id, :meeting_id => meeting_id).first
    if attend_record.update_attributes(attend_params)
      redirect_to '/dashboard'
    end
  end

  private

  def attend_params
    params.require(:attend).permit(:meeting_id, :patient_id, :attended)
  end

end
