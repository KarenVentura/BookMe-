module Api::V1
  class ServiceController < ApiController
    before_action :set_service, only: [:show]
    # GET /v1/users
    # app/controllers/api/v1/users_controller.rb

    # GET /services
    # GET /services.json
    def index
      render json: Service.all
    end

    # GET /services/1
    # GET /services/1.json
    def show
      render json: @service
    end

    # GET /services/new
    def new
      @service = Service.new
    end

    # POST /services
    # POST /services.json
    def create
      @service = Service.new(service_params)

      respond_to do |format|
        if @service.save
          format.json { render action: 'show', status: :created, location: @service }
        else
          format.json { render json: @service.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    def set_service
      @service = Service.find(params[:id])
    end
  end
end
