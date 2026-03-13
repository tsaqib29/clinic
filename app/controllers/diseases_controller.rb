class DiseasesController < ApplicationController
  def index
    @diseases = Disease.order(:name)
  end

  def new
    @disease = Disease.new
  end

  def create
    @disease = Disease.new(disease_params)
    if @disease.save
      redirect_to diseases_path, notice: "Penyakit berhasil ditambahkan"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @disease = Disease.find(params[:id])
  end

  def update
    @disease = Disease.find(params[:id])
    if @disease.update(disease_params)
      redirect_to diseases_path, notice: "Penyakit berhasil diperbarui"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @disease = Disease.find(params[:id])
    @disease.destroy
    redirect_to diseases_path, notice: "Penyakit berhasil dihapus"
  end

  private

  def disease_params
    params.require(:disease).permit(:name, :description)
  end
end
