
class DesignDirectory < ActiveRecord::Base
  belongs_to :user
  has_many :images
  def self.per_page
    5
  end
  has_attached_file :logo, :styles => { :original => "120x70>" },
    :storage => :ftp,
    :path => "/:attachment/:attachment/:id/:style/:filename",
    :url => "http://images.dezineconnect.com/Dezineconnect/:attachment/:attachment/:id/:style/:filename"

  acts_as_xapian :texts => [ :company_name, :company_overview,
    :services, :staff_size,:key_service,:other_service1,:other_service2,:other_service3,:clients1,:clients2,:clients3,
    :year_founded, :custom_url, :address, :city, :state, :country,
    :facebook, :twitter, :linkedin, :website,:logo_file_name
  ],
    :values => [ [ :created_at, 0, "created_at", :date ], [ :updated_at, 1, "updated_at", :date ] ]

end
