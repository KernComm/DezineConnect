class Blog < ActiveRecord::Base
  # image cropping parameters.
  has_attached_file :author_photo, :styles => {:large => "298x238#", :medium => "87x68#",:small => "148x118#",:homepage => "238x81#"}

  has_many  :assets, :as => :attachable, :dependent => :destroy

  validate :validate_attachments

  Max_Attachments = 15
  Max_Attachment_Size = 1.megabyte

  def validate_attachments
    errors.add_to_base("Too many attachments - maximum is #{Max_Attachments}") if assets.length > Max_Attachments
    assets.each {|a| errors.add_to_base("#{a.name} is over #{Max_Attachment_Size/1.megabyte}MB") if a.file_size > Max_Attachment_Size}
  end
  
end
