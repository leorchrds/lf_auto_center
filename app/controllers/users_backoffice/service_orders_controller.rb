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
          format.html { redirect_to users_backoffice_address_path(@service_order), notice: 'Ordem de serviço criada com sucesso.' }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @service_order.update(address_params)
          format.html { redirect_to users_backoffice_address_path(@service_order), notice: 'Ordem de serviço atualizada com sucesso.' }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /clients/1 or /clients/1.json
    def destroy
      @service_order.destroy

      respond_to do |format|
        format.html { redirect_to users_backoffice_address_path, notice: 'Ordem de serviço excluída com sucesso.' }
      end
    end

    private

    def set_service_order
      @service_order = ServiceOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_order_params
      params.require(:address).permit(:street, :number, :complement, :neighborhood, :city, :state, :postal_code, :country, :client_id)
    end
  end
end
