module UsersBackoffice
  class ServiceOrdersController < BaseController
    before_action :set_service_order, only: %i[show edit update destroy]

    def index
      if params[:vehicle_brand].present?
        vehicles = Vehicle.where(brand: params[:vehicle_brand])
        @service_orders = ServiceOrder.where(vehicle_id: vehicles.pluck(:id))
      else
        @service_orders = ServiceOrder.all
      end
      respond_to do |format|
        format.html
        format.js
      end
    end

    def show; end

    def new
      @service_order = ServiceOrder.new
    end

    def edit; end

    def create
          
      @service_order = ServiceOrder.new(service_order_params)

      
      vehicle_model = params[:vehicle_model] # Modelo selecionado na view
      vehicle = Vehicle.find_by(model: vehicle_model)

      # Associe o veículo à ordem de serviço, se encontrado
      @service_order.vehicle = vehicle if vehicle


      respond_to do |format|
        if @service_order.save
          format.html do
            redirect_to users_backoffice_service_order_path(@service_order),
                        notice: 'Ordem de serviço criada com sucesso.'
          end
        else
          puts @service_order.errors.full_messages # Isso irá imprimir os erros no console
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @service_order.destroy

      respond_to do |format|
        format.html do
          redirect_to users_backoffice_service_orders_path, notice: 'Ordem de serviço excluída com sucesso.'
        end
      end
    end

    private

    def set_service_order
      @service_order = ServiceOrder.find(params[:id])
    end

    def service_order_params
      params.require(:service_order).permit(
        :client_id, :vehicle_id, :mileage, :entry_time, :exit_time,
        :entry_date, :exit_date, :description, address_attributes:
        %i[street number complement neighborhood city state postal_code country]
      )
    end
  end
end
