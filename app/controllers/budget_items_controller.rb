class BudgetItemsController < ApplicationController
  # GET /budget_items
  # GET /budget_items.json
  def index
    @budget_items = BudgetItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @budget_items }
    end
  end

  # GET /budget_items/1
  # GET /budget_items/1.json
  def show
    @budget_item = BudgetItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @budget_item }
    end
  end

  # GET /budget_items/new
  # GET /budget_items/new.json
  def new
    @budget_item = BudgetItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @budget_item }
    end
  end

  # GET /budget_items/1/edit
  def edit
    @budget_item = BudgetItem.find(params[:id])
  end

  # POST /budget_items
  # POST /budget_items.json
  def create
    @budget_item = BudgetItem.new(params[:budget_item])

    respond_to do |format|
      if @budget_item.save
        format.html { redirect_to @budget_item, notice: 'Budget item was successfully created.' }
        format.json { render json: @budget_item, status: :created, location: @budget_item }
      else
        format.html { render action: "new" }
        format.json { render json: @budget_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /budget_items/1
  # PUT /budget_items/1.json
  def update
    @budget_item = BudgetItem.find(params[:id])

    respond_to do |format|
      if @budget_item.update_attributes(params[:budget_item])
        format.html { redirect_to @budget_item, notice: 'Budget item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @budget_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budget_items/1
  # DELETE /budget_items/1.json
  def destroy
    @budget_item = BudgetItem.find(params[:id])
    @budget_item.destroy

    respond_to do |format|
      format.html { redirect_to budget_items_url }
      format.json { head :no_content }
    end
  end
end
