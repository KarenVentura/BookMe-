module Api::V1
  class ServicesController < ApiController
    before_action :set_service, only: [:show, :edit, :update, :destroy]
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

    # POST /services
    # POST /services.json
    def create
      @service = Service.new(service_params)

      if @service.save
        render json: { action: 'show', status: :created, location: @service }
      else
        render json: { errors: @service.errors}
      end
    end

    # PATCH/PUT /service/1
    # PATCH/PUT /service/1.json
    def update
      @service.update(service_params)
      if @service.update(service_params)
        render json: { status: "your service was updated" }
      else
        render json: { errors: @service.errors}
      end
    end

    # DELETE /service/1
    # DELETE /service/1.json
    def destroy
      @service.destroy
      render json: { status: "your service was deleted" }
    end

    private

    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.required(:service).permit(:name, :description, :week_days, :specialty, :category_id, :user_id) if params[:service]
    end
  end
end
