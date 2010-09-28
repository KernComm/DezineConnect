class User < ActiveRecord::Base
  has_one :portfolio
  has_one :design_directory
  has_many :jobs
end
