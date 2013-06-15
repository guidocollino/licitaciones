class BudgetsController < ApplicationController
  # GET /budgets
  # GET /budgets.json
  def index
    @budgets = Budget.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @budgets }
    end
  end

  # GET /budgets/1
  # GET /budgets/1.json
  def show
    @budget = Budget.find(params[:id])

    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render json: @budget }
    #end

    respond_to do |format|
      format.pdf { render :layout => false }
    end
  end

  # GET /budgets/new
  # GET /budgets/new.json
  def new
    @budget = Budget.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @budget }
    end
  end

  # GET /budgets/1/edit
  def edit
    @budget = Budget.find(params[:id])
  end

  # POST /budgets
  # POST /budgets.json
  def create
    @budget = Budget.new(params[:budget])
    if params[:commit] == 'Guardar'
      action = "edit"
    elsif params[:commit] == 'Guardar y Salir'
      action = "index"
    end
    respond_to do |format|
      if @budget.save
        format.html { render action: action, notice: 'Se ha creado un nuevo presupuesto' }
        format.json { render json: @budget, status: :created, location: @budget }
      else
        format.html { render action: "new" }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /budgets/1
  # PUT /budgets/1.json
  def update
    @budget = Budget.find(params[:id])

    respond_to do |format|
      if @budget.update_attributes(params[:budget])

        format.html {
          if params[:commit].eql?("Guardar")
            render action: "edit", notice: 'Los cambios fueron guardados'
          else
            redirect_to budgets_url, notice: 'Los cambios fueron guardados'
          end
        }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budgets/1
  # DELETE /budgets/1.json
  def destroy
    @budget = Budget.find(params[:id])
    @budget.destroy

    respond_to do |format|
      format.html { redirect_to budgets_url }
      format.json { head :no_content }
    end
  end

  def to_pdf
    output = HelloReeport.new.to_pdf
    respond_to do |format|
      format.all { render :text => output}
    end
  end
  
  def names_budget_items
    names_budget_items = BudgetItem.find(:all, :select => "DISTINCT(detail)", :conditions=> ["detail like ?", "%#{params[:term]}%"])
    names_budget_items = names_budget_items.collect { |item| item.detail  }
    respond_to do |format|
        format.json { render json: names_budget_items }
    end
  end
end
