class Admin::PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def index
    @patients = Patient.active.order(created_at: :desc)
  end

  def show
    @visits = @patient.visits.order(visit_date: :desc)
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to [:admin, @patient], notice: "Pasien berhasil ditambahkan"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to [:admin, @patient], notice: "Data pasien diperbarui"
    else
      render :edit
    end
  end

  def destroy
    @patient.update(deleted_at: Time.current)
    redirect_to admin_patients_path, notice: "Pasien berhasil dihapus", status: :see_other
  end

  private

  def set_patient
    @patient = Patient.active.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :phone, :age, :address, :keluhan)
  end
end
