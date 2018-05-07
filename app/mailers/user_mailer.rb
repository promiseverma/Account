class UserMailer < ApplicationMailer
	helper :application
	default from: 'notifications@example.com'
 
  def transaction_email account
    @user = User.find(account.user_id)
    @account = account
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Transaction Email')
  end
end
