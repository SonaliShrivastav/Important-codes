class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  # GET /expenses
  # GET /expenses.json
  def index
    if params[:date_from].present? && params[:date_to].present?
      date_from = Date.parse(params[:date_from])
      date_to   = Date.parse(params[:date_to])
      @expenses = Expense.where('date BETWEEN ? AND ?', date_from.beginning_of_day, date_to.end_of_day)
    else
      @expenses = Expense.all
    end
  end

  def bar
    from_date, to_date = current_month
    @current_month_expenses = Expense.where('date BETWEEN ? AND ?', from_date, to_date)

    from_date, to_date = last_month
    @last_month_expenses = Expense.where('date BETWEEN ? AND ?', from_date, to_date)
  end

  def current_month
    date = Date.today
    [date.beginning_of_month, date.end_of_month]
  end

  def last_month
    date = Date.today - 1.month
    [date.beginning_of_month, date.end_of_month]
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Expense.new(expense_params)

    respond_to do |format|
      if @expense.save
        format.html { redirect_to @expense, notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:date, :amount)
    end
end
