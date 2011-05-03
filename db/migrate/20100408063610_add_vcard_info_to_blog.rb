class AddVcardInfoToBlog < ActiveRecord::Migration
    def self.up
      add_column :blogs, :vcard_mail, :text
      add_column :blogs, :vcard_phone, :text
      add_column :blogs, :vcard_skype, :text
      add_column :blogs, :vcard_website, :text
      add_column :blogs, :vcard_blog, :text
      add_column :blogs, :vcard_facebook, :text
      add_column :blogs, :vcard_twitter, :text
      add_column :blogs, :vcard_flickr, :text
      add_column :blogs, :vcard_linkedin, :text
      add_column :blogs, :vcard_youtube, :text
      add_column :blogs, :vcard_vimeo, :text
      add_column :blogs, :vcard_delicious, :text
    end

    def self.down
      remove_column :blogs, :vcard_mail
      remove_column :blogs, :vcard_phone
      remove_column :blogs, :vcard_skype
      remove_column :blogs, :vcard_website
      remove_column :blogs, :vcard_blog
      remove_column :blogs, :vcard_facebook
      remove_column :blogs, :vcard_twitter
      remove_column :blogs, :vcard_flickr
      remove_column :blogs, :vcard_linkedin
      remove_column :blogs, :vcard_youtube
      remove_column :blogs, :vcard_vimeo
      remove_column :blogs, :vcard_delicious
    end
end
