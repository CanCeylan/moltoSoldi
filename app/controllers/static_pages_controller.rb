class StaticPagesController < ApplicationController
  def home
     @transactions = current_user.transactions.paginate(page: params[:page], per_page: 4)
      @transactions_by_date = @transactions.group_by(&:deadline)
      @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def help
  end
  
  def about
  end
end
