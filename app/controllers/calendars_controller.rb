def index
  @transactions = Transaction.all
  @transactions_by_date = @transactions.group_by(&:created_at)
  @date = params[:date] ? Date.parse(params[:date]) : Date.today
end