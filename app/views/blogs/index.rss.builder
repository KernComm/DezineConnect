
# index.rss.builder
xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "DezineConnect"
    xml.description "connecting designers"
    xml.link "http://www.dezineconnect.com"

    for blog in @blogs
      xml.item do
        xml.title blog.blog_statement + " - " + blog.name
        xml.description blog.content_for_home_page
        xml.pubDate blog.created_at.to_s(:rfc822)
        if blog.name == 'Neil Dantas' then
          xml.link "http://www.dezineconnect.com/dlog/neil_dantas"
          xml.guid "http://www.dezineconnect.com/dlog/neil_dantas"
        elsif blog.name == 'Neha Ramaiya' then
          xml.link "http://www.dezineconnect.com/dlog/neha_ramaiya"
          xml.guid "http://www.dezineconnect.com/dlog/neha_ramaiya"
        elsif blog.name == 'Rahul Mishra' then
          xml.link "http://www.dezineconnect.com/dlog/rahul_mishra"
          xml.guid "http://www.dezineconnect.com/dlog/rahul_mishra"
        end
        
      end
    end
  end
end

