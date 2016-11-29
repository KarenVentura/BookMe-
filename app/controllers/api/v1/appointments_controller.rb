module Api::V1
  class AppointmentsController < ApiController
    before_action :set_appointment, only: [:show, :edit, :update, :destroy]
    before_action :set_service, only: [:index, :create]

    def index
    render json: @service.appointments
    end

    def show
      render json: @appointment
    end

    def create
      @appointment = @service.appointments.new(appointment_params)

      if @appointment.save
        render json: { action: 'show', status: :created, location: @appointment }
      else
        render json: { errors: @appointment.errors}
      end
    end

    def update
      @appointment.update(appointment_params)
      if @appointment.update(appointment_params)
        render json: { status: "your appointment was updated" }
      else
        render json: { errors: @appointment.errors}
      end
    end

    def destroy
      @appointment.destroy
      render json: { status: "your appointment was deleted" }
    end

    private

    def set_service
      @service = Service.find(params[:service_id])
    end

    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.required(:appointment).permit(:initial_time, :final_time, :description, :service_id, :user_id) if params[:appointment]
    end
  end
end
