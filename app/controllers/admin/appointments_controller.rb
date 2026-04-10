class Admin::AppointmentsController < ApplicationController
    def new
        @appointment = Appointment.new
        @date = params[:date]
    end

    def create
        @appointment = Appointment.new(appointment_params)

        if @appointment.save
            redirect_to admin_visits_path, notice: "Janji berhasil ditambahkan"
        else
            render :new
        end
    end

    def destroy
        @appointment = Appointment.find(params[:id])
        @appointment.update(deleted_at: Time.current)

        redirect_to admin_visits_path(date: @appointment.scheduled_date),
                    notice: "Janji dihapus",
                    status: :see_other
    end

    private

    def appointment_params
        params.require(:appointment).permit(:patient_id, :scheduled_date, :note)
    end
end
