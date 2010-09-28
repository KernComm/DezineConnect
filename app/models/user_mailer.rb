class UserMailer < ActionMailer::Base
  def forgot_password(user)
    css :email
    recipients  user.email
    from        "'DezineConnect Team' <team@dezineconnect.com>"
    subject     "Account Credentials"
    body        :user => user
    content_type "text/html"
  end

end
