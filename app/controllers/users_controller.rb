class UsersController < ApplicationController
  

  def show
    @user = User.find(params[:id])
    @friends = User.find(params[:id]).friends
    @transactions = User.find(params[:id]).transactions.paginate(page: params[:page], per_page: 10)
  end
  
  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end
  
  def loans
     @title = "Following"
     @user = User.find(params[:id])
     @users = @user.followed_users.paginate(page: params[:page])
     render 'show_follow'
  end
  
  
end
  
