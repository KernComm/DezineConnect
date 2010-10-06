class JobApplication < ActiveRecord::Base
  has_attached_file :resume
  validates_attachment_size :resume, :less_than=>500.kilobyte, :unless => :resume.blank?
  has_attached_file :portfolio
  validates_attachment_size :portfolio,:less_than=>1.megabyte, :unless => :portfolio.blank?
  belongs_to :user
  belongs_to :job
end
