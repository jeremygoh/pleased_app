class AttendsController < ApplicationController
  def index
    @meeting = Meeting.find(params[:meeting_id])
  end
end
