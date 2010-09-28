class JobApplicationMailer < ActionMailer::Base
  def job_application_confirmation(job_application)
    css :email
    recipients  job_application.email
    from        "'DezineConnect Team' <team@dezineconnect.com>"
    subject     "Activate your job application"
    body        :job_application => job_application
    content_type "text/html"
  end


  def job_application_sent_to_company(job_application)
    css :email
    recipients  job_application.job.how_to_apply_email
    from        "'DezineConnect Team' <team@dezineconnect.com>"
    subject     "New Job Application"
    sent_on Time.now
    content_type "multipart/alternative"

    part :content_type => "text/html",
        :body => render_message("application_sent_to_company", :job_application => job_application)
  
    unless job_application.resume.path.nil?
      attachment :content_type => job_application.resume_content_type,
                 :filename => 'Resume_'+job_application.Name+'_'+job_application.created_at.strftime("%b %d")+'.'+job_application.resume_file_name.split(".")[1],
                 :body => File.read(job_application.resume.path(:original))
    end
    unless job_application.portfolio.path.nil?
      attachment :content_type => job_application.portfolio_content_type,
                 :filename => 'Portfolio_'+job_application.Name+'_'+job_application.created_at.strftime("%b %d")+'.'+job_application.portfolio_file_name.split(".")[1],
                 :body => File.read(job_application.portfolio.path(:original))
    end
  end

end
