class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def index
    @patients = Patient.active.order(created_at: :desc)
  end

  def show
    @patient = Patient.find(params[:id])
    @visits = @patient.visits.order(visit_date: :desc)
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to @patient, notice: "Pasien berhasil ditambahkan"
    else
      render :new
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])

    if @patient.update(patient_params)
      redirect_to @patient, notice: "Data pasien diperbarui"
    else
      render :edit
    end
  end

  def destroy
    @patient.update(deleted_at: Time.current)
    redirect_to patients_path, notice: "Pasien berhasil dihapus"
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :phone, :age, :address, :keluhan)
  end
end
