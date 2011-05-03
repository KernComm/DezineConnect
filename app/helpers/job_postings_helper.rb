module JobPostingsHelper

  def anonymous_email_id

    # get the last record form the Job Posting table.
    last_record = JobPosting.find(:all, :order => "id desc", :limit => 1).reverse

    unless last_record.empty? then
      logger.info "last_record : #{last_record.inspect}"
      # Construct email
      email = last_record[0].id.to_s() + "@jobs.dezineconnect.com"
    else
      email = 98765432.to_s() + "@jobs.dezineconnect.com"
    end

    # return ananymous email
    email
  end
  
end
