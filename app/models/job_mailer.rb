class JobMailer < ActionMailer::Base
  def job_posting_confirmation(job)
    css :email
    recipients  job.email
    from        "'DezineConnect Team' <team@dezineconnect.com>"
    subject     "Activate your job posting"
    body        :job => job
    content_type "text/html"

  end
end
