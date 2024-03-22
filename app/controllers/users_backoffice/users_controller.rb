module UsersBackoffice
  class UsersController < BaseController
    def index
      @users = User.all
    end

    def show; end

    def new
      @user = user.new
    end

    def edit; end

    def create
      @user = user.new(user_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to users_backoffice_users_path(@user), notice: 'user criado com sucesso.' }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to users_backoffice_users_path(@user), notice: 'user atualizado com sucesso.' }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @user.destroy

      respond_to do |format|
        format.html { redirect_to users_backoffice_users_path, notice: 'usere excluído com sucesso.' }
      end
    end

    private

    def set_user
      @user = user.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :address, :phone, :observation)
    end
  end
end
