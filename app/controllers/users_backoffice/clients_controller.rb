module UsersBackoffice
  class ClientsController < BaseController
    before_action :set_client, only: %i[show edit update destroy]

    def index
      @clients = Client.all
    end

    def show; end

    def new
      @client = Client.new
      @client.build_address
    end

    def edit; end

    def create
      @client = Client.new(client_params)

      respond_to do |format|
        if @client.save
          format.html { redirect_to users_backoffice_clients_path(@client), notice: 'Cliente criado com sucesso.' }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @client.update(client_params)
          format.html { redirect_to users_backoffice_client_path(@client), notice: 'Cliente atualizado com sucesso.' }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @client.destroy

      respond_to do |format|
        format.html { redirect_to users_backoffice_clients_path, notice: 'Cliente excluído com sucesso.' }
      end
    end

    private

    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:name, :phone, :observation, address_attributes: [:street, :number, :complement, :neighborhood, :city, :state, :postal_code, :country])
    end
  end
end
