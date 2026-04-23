class AppointmentsController < ApplicationController
  def index
    @appointments =
      if params[:filter] == "upcoming"
        Appointment.includes(:pet, :vet).upcoming
      elsif params[:filter] == "past"
        Appointment.includes(:pet, :vet).past
      else
        Appointment.includes(:pet, :vet).all
      end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end
end