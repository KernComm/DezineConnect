class JobApplication < ActiveRecord::Base
  has_attached_file :resume
  validates_attachment_size :resume, :less_than=>500.kilobyte, :message=>"Resume file exceeds 500kb"
  has_attached_file :portfolio
  validates_attachment_size :portfolio, :less_than=>1.megabyte, :message=>"portfolio file exceeds 1 mb"
  belongs_to :user
  belongs_to :job
end
