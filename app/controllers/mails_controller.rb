class MailsController < ApplicationController
  def create                     
    @email = params[:email]
    @name = params[:name]                    
    
    TransactionMailer.transaction_reminder(@email, @name).deliver
  end
end