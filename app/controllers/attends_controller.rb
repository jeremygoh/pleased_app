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



  private

  def attend_params
    params.require(:attend).permit(:meeting_id, :patient_id, :attended)
  end

end
