module UsersBackoffice
  class AddressesController < BaseController
    before_action :set_address, only: %i[show edit update destroy]

    def index
      @addresses = Address.all
    end

    def show; end

    def new
      @address = Address.new
    end

    def edit; end

    def create
      @address = Address.new(address_params)

      respond_to do |format|
        if @address.save
          format.html { redirect_to users_backoffice_address_path(@address), notice: 'Endereço criado com sucesso.' }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @address.update(address_params)
          format.html { redirect_to users_backoffice_address_path(@address), notice: 'Endereço atualizado com sucesso.' }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /clients/1 or /clients/1.json
    def destroy
      @address.destroy

      respond_to do |format|
        format.html { redirect_to users_backoffice_addresses_path, notice: 'Endereço excluído com sucesso.' }
      end
    end

    private

    def set_address
      @address = Address.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address).permit(:street, :number, :complement, :neighborhood, :city, :state, :postal_code, :country, :client_id)
    end
  end
end
