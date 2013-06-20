class ExpenseHistoriesController < ApplicationController
  # GET /expense_histories
  # GET /expense_histories.json
  def index
    @expense_histories = ExpenseHistory.order("id DESC").page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expense_histories }
    end
  end

  # GET /expense_histories/1
  # GET /expense_histories/1.json
  def show
    @expense_history = ExpenseHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @expense_history }
    end
  end

  # GET /expense_histories/new
  # GET /expense_histories/new.json
  def new
    @expense_history = ExpenseHistory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @expense_history }
    end
  end

  # GET /expense_histories/1/edit
  def edit
    @expense_history = ExpenseHistory.find(params[:id])
  end

  # POST /expense_histories
  # POST /expense_histories.json
  def create
    @expense_history = ExpenseHistory.new(params[:expense_history])

    respond_to do |format|
      if @expense_history.save
        format.html { redirect_to @expense_history, notice: 'Expense history was successfully created.' }
        format.json { render json: @expense_history, status: :created, location: @expense_history }
      else
        format.html { render action: "new" }
        format.json { render json: @expense_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /expense_histories/1
  # PUT /expense_histories/1.json
  def update
    @expense_history = ExpenseHistory.find(params[:id])

    respond_to do |format|
      if @expense_history.update_attributes(params[:expense_history])
        format.html { redirect_to @expense_history, notice: 'Expense history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @expense_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expense_histories/1
  # DELETE /expense_histories/1.json
  def destroy
    @expense_history = ExpenseHistory.find(params[:id])
    @expense_history.destroy

    respond_to do |format|
      format.html { redirect_to expense_histories_url }
      format.json { head :no_content }
    end
  end
end
