class Admin::VisitsController < ApplicationController
  before_action :set_visit, only: [:show, :edit, :update, :destroy]
  before_action :set_patient, only: [:new, :create]

  def index
    @date = params[:date] ? Date.parse(params[:date]) : Date.today

    @visits = Visit.active
                 .includes(:patient)
                 .where(next_visit_date: @date)

    @appointments = Appointment
                    .includes(:patient)
                    .where(scheduled_date: @date, deleted_at: nil)

    @visit_counts = Visit.active.group(:next_visit_date).count
    @appointment_counts = Appointment.where(deleted_at: nil).group(:scheduled_date).count

    if params[:date].present?
      render partial: "modal"
    end
  end

  def show
  end

  def new
    @visit = @patient.visits.new
  end

  def create
    cleaned_cost = visit_params[:cost].to_s.gsub(".", "")

    @visit = @patient.visits.new(
      visit_params.merge(cost: cleaned_cost)
    )

    if @visit.save
      redirect_to admin_patient_path(@patient), notice: "Kunjungan berhasil ditambahkan"
    else
      render :new
    end
  end

  def edit
  end

  def update
    cleaned_cost = visit_params[:cost].to_s.gsub(".", "")

    if @visit.update(visit_params)
      redirect_to admin_patient_path(@visit.patient), notice: "Kunjungan berhasil diupdate"
    else
      render :edit
    end
  end

  def destroy
    @visit.update(deleted_at: Time.current)

    redirect_to admin_visits_path(date: @visit.next_visit_date),
                notice: "Kunjungan dihapus",
                status: :see_other
  end

  private

  def set_patient
    @patient = Patient.active.find(params[:patient_id]) if params[:patient_id]
  end

  def set_visit
    @visit = Visit.active.find(params[:id])
  end

  def visit_params
    params.require(:visit).permit(
      :patient_id,
      :visit_date,
      :next_visit_date,
      :cost
    )
  end
end
