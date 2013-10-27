class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  def index
    @meetings = Meeting.all
  end

  def show
    @patients = Meeting.joins(:groups).where('groups.id = params[:id]')
  end

  def new
    @meeting = Meeting.new
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def create
    @meeting = Meeting.new(meeting_params)

    if @meeting.save
      flash[:success] = "Meeting was successfully created"
      redirect_to @meeting
    else
      flash[:error] = @meeting.errors.full_messages[0]
      redirect_to new_meeting_url

    end
  end

  def update
    if @meeting.update(meeting_params)
      redirect_to @meeting
      flash[:success] = "Meeting was succesfully updated."
    else
      flash[:error] = @meeting.errors.full_messages[0]
    end
  end

  def destroy
    @meeting.destroy
    redirect_to meetings_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:date, :group_id)
    end
end
