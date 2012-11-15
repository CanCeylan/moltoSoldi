class MailsController < ApplicationController
  def create                     
    @email = params[:email]
    @name = params[:name] 
    @content = params[:content]                   
    
    TransactionMailer.transaction_reminder(@email, @name, @content).deliver
  end
end