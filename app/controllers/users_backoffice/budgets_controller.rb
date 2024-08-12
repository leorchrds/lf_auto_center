module UsersBackoffice
  class BudgetsController < BaseController
    before_action :set_budget, only: %i[show edit update destroy]

    def index
      @budgets = Budget.all.includes(:budget_line_items).all
    end

    def show; end

    def new
      @budget = Budget.new
    end

    def edit; end

    def create
      @budget = Budget.new(budget_params)

      respond_to do |format|
        if @budget.save
          format.html { redirect_to users_backoffice_budgets_path(@budget), notice: 'orçamento criado com sucesso.' }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @budget.update(budget_params)
          format.html { redirect_to users_backoffice_budgets_path, notice: 'orçamento atualizado com sucesso.' }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @budget.destroy

      respond_to do |format|
        format.html { redirect_to users_backoffice_budgets_path, notice: 'orçamento excluído com sucesso.' }
      end
    end

    def generate_pdf
      @budget = Budget.find(params[:id])
      respond_to do |format|
        format.pdf do
          render pdf: 'budget_pdf',
                 template: 'users_backoffice/budgets/pdf_template.html.erb',
                 layout: 'pdf.html'
        end
      end
    end

    private

    def set_budget
      @budget = Budget.find(params[:id])
    end

    def budget_params
      params.require(:budget).permit(:client_id, :total, budget_line_items_attributes: [:id, :service_name, :quantity, :unit_price])
    end
  end
end
