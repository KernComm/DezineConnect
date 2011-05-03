class User < ActiveRecord::Base
  has_one :portfolio
  has_one :design_directory
end
