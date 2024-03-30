module UsersBackoffice

  class VehiclesController < BaseController
    before_action :set_vehicle, only: %i[show edit update destroy]

    def index
      @vehicles = Vehicle.all
    end

    def edit; end

    def new
      @vehicle = Vehicle.new
    end

    def show; end

    def create
      @vehicle = Vehicle.new(vehicle_params)

      respond_to do |format|
        if @vehicle.save
          format.html { redirect_to users_backoffice_vehicles_path(@vehicle), notice: 'Veículo criado com sucesso.' }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @Vehicle.update
          format.html do
            redirect_to users_backoffice_vehicles_path(@vehicle), notice: 'Veículo atualizado com sucesso.'
          end
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @vehicle.destroy

      respond_to do |format|
        format.html { redirect_to users_backoffice_vehicles_path(@vehicles), notice: 'Veículo excluído com sucesso.' }
      end
    end

    private


    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    def vehicle_params
      params.require(:vehicle).permit(:license_plate, :brand, :model, :color, :year_of_manufacture, :fuel_type, :client_id)
    end

  end
end
