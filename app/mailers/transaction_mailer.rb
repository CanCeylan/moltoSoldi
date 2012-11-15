class TransactionMailer < ActionMailer::Base
  default from: "moltosoldiapp@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.transaction_mailer.transaction_created.subject
  #
  def transaction_created(user)
      @user = user
      mail to: user.email, subject: "Sign Up Confirmation"
  end
  
  def transaction_reminder(email, name, content)
    @email = email
    @name = name       
    @content = content            
    
    mail to: @email, subject: "You have a dept to pay !", bcc: "orhancanceylan@gmail.com"
  end
end
