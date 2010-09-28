class JobApplication < ActiveRecord::Base
  has_attached_file :resume
  has_attached_file :portfolio
  belongs_to :user
  belongs_to :job
end
