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
     @user = User.find(params[:id])
     @friends = @user.friends.paginate(page: params[:page])
     render 'lends'
  end
  
  def lends
     @title = "Borrows"
     @user = User.find(params[:id])
     @friends = @user.friends.paginate(page: params[:page])
     render 'borrows'
  end
  
  
end
  
