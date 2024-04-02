module UsersBackoffice
  class ServiceOrdersController < BaseController
    before_action :set_service_order, only: %i[show edit update destroy]

    def index
      @service_orders = ServiceOrder.all
    end

    def show; end

    def new
      @service_order = ServiceOrder.new
    end

    def edit; end

    def create
      @service_order = ServiceOrder.new(service_order_params)
      respond_to do |format|
        if @service_order.save
          format.html do
            redirect_to users_backoffice_service_order_path(@service_order),
                        notice: 'Ordem de serviço criada com sucesso.'
          end
        else
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
