class ExpensesController < ApplicationController
  before_filter :authenticate_user!
  # GET /expenses
  # GET /expenses.json
  def index
    @q = Expense.order("id DESC").search(params[:q])
    @expenses = @q.result
    @expenses = @expenses.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expenses }
    end
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
    @expense = Expense.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @expense }
    end
  end

  # GET /expenses/new
  # GET /expenses/new.json
  def new
    @expense = Expense.new
    @users = User.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @expense }
    end
  end

  # GET /expenses/1/edit
  def edit
    @expense = Expense.find(params[:id])
    @users = User.all
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Expense.new(params[:expense])
    # 이력 저장하는 로직 추가
    expenseHistory = ExpenseHistory.new(params[:expense])
    expenseHistory.save
    
    # existing = Expense.find_by_creditor_id_and_debtor_id(@expense.creditor.id, @expense.debtor.id)
    # reverse = Expense.find_by_creditor_id_and_debtor_id(@expense.debtor.id, @expense.creditor.id)
#     
    # if existing
      # existing.money += @expense.money
      # ret = existing.save
    # elsif reverse
      # if reverse.money > @expense.money
        # reverse.money -= @expense.money
        # ret = reverse.save
      # elsif reverse.money < @expense.money
        # @expense.money -= reverse.money
        # ret = @expense.save
        # ret = reverse.destroy
      # else
        # ret = reverse.destroy     
      # end   
    # else
      # ret = @expense.save
    # end
    
    if ret = @expense.save
      redirect_to @expense, notice: 'Expense was successfully created.'
    else
      rener action: "new"
    end
  end

  # PUT /expenses/1
  # PUT /expenses/1.json
  def update
    @expense = Expense.find(params[:id])

    respond_to do |format|
      if @expense.update_attributes(params[:expense])
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to expenses_url }
      format.json { head :no_content }
    end
  end
  
  def sum
    expenses = Expense.all
    h = Hash.new    
    
    # 키가 같은게 있을때 금액을 합쳐주는 로직
    expenses.each do |expense|
      key = expense.creditor_id.to_s + '_' + expense.debtor_id.to_s
      if h.key? key
        h[key] += expense.money  
      else
        h[key] = expense.money
      end
    end
    
    # reverse를 찾아서 빼준다
    h.each do |key, value|
      id = key.split '_'
      reverse = id[1] + '_' + id[0]
      if h.key? reverse
        if h[key] > h[reverse]
          h[key] -= h[reverse]
          h.delete reverse
        elsif h[key] < h[reverse]
          h[reverse] -= h[key]
          h.delete key
        else
          h.delete key
          h.delete reverse
        end
      end
    end
    
    # 해쉬를 다시 리스트로 변환
    @expenses = []
    h.each do |key, value|
      id = key.split '_'
      e = Expense.new
      e.creditor_id = id[0]
      e.debtor_id = id[1]
      if value > 0
        e.money = value
        @expenses << e
      end
    end
    
    @expenses.sort! {|x,y| x.creditor_id <=> y.creditor_id }
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expenses }
    end
  end
end
