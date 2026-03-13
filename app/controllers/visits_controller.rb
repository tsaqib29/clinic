class VisitsController < ApplicationController
  before_action :set_patient, except: [:tomorrow]
  before_action :set_visit, only: [:show, :edit, :update, :destroy]

  def index
    @visits = Visit.includes(:patient).order(visit_date: :desc)

    @today_visits = Visit.includes(:patient)
                       .where(visit_date: Date.today)

    @tomorrow_visits = Visit.includes(:patient)
                            .where(next_visit_date: Date.tomorrow)
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
      redirect_to patient_path(@patient), notice: "Kunjungan berhasil ditambahkan"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @visit.update(visit_params)
      redirect_to patient_path(@patient), notice: "Kunjungan berhasil diupdate"
    else
      render :edit
    end
  end

  def destroy
    @visit.destroy
    redirect_to patient_path(@patient), notice: "Kunjungan dihapus"
  end

  def tomorrow
    next_day = Date.current.next_weekday

    @visits = Visit.includes(:patient).order(visit_date: :desc)

    @today_visits = Visit.includes(:patient)
                       .where(visit_date: Date.today)

    @tomorrow_visits = Visit.includes(:patient)
                            .where(next_visit_date: next_day)
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_visit
    @visit = @patient.visits.find(params[:id])
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
