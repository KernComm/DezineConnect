class Portfoliomailer < ActionMailer::Base
  def portfolio_confirmation(user)   
    css :email
    recipients  user.email
    from        "'DezineConnect Team' <team@dezineconnect.com>"
    subject     "Activate your DezineConnect Portfolio"
    body        :user => user
    content_type "text/html"
  end
end
