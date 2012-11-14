class UsersController < ApplicationController
  

  def show
    @user = User.find(params[:id])
    @friends = User.find(params[:id]).friends
    @transactions = User.find(params[:id]).transactions.paginate(page: params[:page], per_page: 10)
  end
  
  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end
  
  def lends
     @title = "Lends"
     @date = params[:date] ? Date.parse(params[:date]) : Date.today
     @user = User.find(params[:id])
     @friends = @user.friends.paginate(page: params[:page])
     @transactions = User.find(params[:id]).transactions.where(:t_type => 2).paginate(page: params[:page], per_page: 5)
     render 'lends'
  end
  
  def borrows
     @title = "Borrows"
     @user = User.find(params[:id])
     @friends = @user.friends.paginate(page: params[:page])
      @transactions = User.find(params[:id]).transactions.where(:t_type => 1).paginate(page: params[:page], per_page: 5)
     render 'borrows'
  end
  

  
  
end
  
