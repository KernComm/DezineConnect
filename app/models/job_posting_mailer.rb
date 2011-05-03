class JobPostingMailer < ActionMailer::Base
  
  def login_confirmation(user)
    #recipients  user.email
    recipients  "team@dezineconnect.com"
    from        "team@dezineconnect.com"
    subject     "Welcome to Dezine-Connect"
    body        :user => user
  end

  def apply_job_confirmation(user)
    #recipients  user.email
    css :email
    recipients  "team@dezineconnect.com"
    from        "team@dezineconnect.com"
    subject     "Confrimation - Job Posting"
    body        :user => user
    content_type "text/html"
  end

  def send_email_to_HR(user, job_posting_id)
    css :email
    recipients  "#{user}"
    from        "team@dezineconnect.com"
    subject     "JobPosted successfuly on DezineConnect."
    logger.info "session[:job_posting_id] in model : #{job_posting_id}"
    body        :job_posting_id => job_posting_id
    content_type "text/html"
  end
  
end
