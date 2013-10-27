class AttendsController < ApplicationController
 before_filter :authenticate_user!

  def index
    @meeting = Meeting.find(params[:meeting_id])
  end

  def create
    patient_id = params[:patient_id]
    meeting_id = params[:meeting_id]
    existing_records = Attend.where(:patient_id => patient_id, :meeting_id => meeting_id)
    if existing_records.size > 0
      existing_records.each do |record|
        record.destroy
        attend = Attend.new(attend_params)
         if attend.save
          render json: nil, status: :ok
        end
      end
    else
      attend = Attend.new(attend_params)
         if attend.save
           render json: nil, status: :ok
        end
    end



  end

  # def update
  #   patient_id = params[:attend][:patient_id]
  #   patient = Patient.find(patient_id)
  #   meeting_id = params[:attend][:meeting_id]
  #   attend_record = Attend.where(:patient_id => patient.id, :meeting_id => meeting_id).first
  #   attend_record.update_attributes(attend_params)
  # end

  private

  def attend_params
    params.permit(:meeting_id, :patient_id, :attended)
  end

end
