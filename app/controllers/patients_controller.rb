class PatientsController < ApplicationController

  def new
    @patient = Patient.new
  end

  def index
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      flash[:success] = "Patient created successfully"
      redirect_to '/patients'
    else
      render 'new'
    end
  end

private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :email, :phone)
  end

end



