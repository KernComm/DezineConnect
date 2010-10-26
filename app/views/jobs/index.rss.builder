
# index.rss.builder
xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Designer Jobs in India"
    xml.description "Designer Jobs in India"
    xml.link "http://www.dezineconnect.com"

    for job in @jobs
      xml.item do
        xml.title job.job_title
        xml.description job.job_title+" required at "+job.company_name+" in "+job.location
        xml.pubDate job.created_at.to_s(:rfc822)
        xml.link "http://www.dezineconnect.com/jobs/show/#{job.id}"
        xml.guid "http://www.dezineconnect.com/jobs/show/#{job.id}"
      end
    end
  end
end

