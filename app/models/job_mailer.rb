class JobMailer < ActionMailer::Base
  def job_posting_confirmation(job)
    css :email
    recipients  job.email
    from        "'DezineConnect Team' <team@dezineconnect.com>"
    subject     "Activate your job posting"
    body        :job => job
    content_type "text/html"
  end

  def email_to_job_publisher(job)
    css :email
    recipients  job.job_posting_detail.job_poster_email
    from        "'DezineConnect Team' <team@dezineconnect.com>"
    subject     "Job - #{job.job_title} posted on #{job.job_posting_detail.job_source}"
    body        :job => job
    content_type "text/html"
  end
end
