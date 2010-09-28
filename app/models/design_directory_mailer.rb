class DesignDirectoryMailer < ActionMailer::Base
   def design_directory_confirmation(user)
    css :email
    recipients  user.email
    from        "'DezineConnect Team' <team@dezineconnect.com>"
    subject     "Activate your DezineConnect Directory"
    body        :user => user
    content_type "text/html"
  end

end
