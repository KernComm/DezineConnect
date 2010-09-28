class Portfolio < ActiveRecord::Base
  has_attached_file :profile_photo, :convert_options => {
                               :all => "-depth 8 -density 96 -resample 96x96",
                               :negative => "-negate"
                             },
                             :styles => { :original => "120x120#" },
                       :storage => :ftp,
                       :path => "/:attachment/:attachment/:id/:style/:filename",
                       :url => "http://images.dezineconnect.com/Dezineconnect/:attachment/:attachment/:id/:style/:filename"
  has_attached_file :featured_photo, :styles => { :original => "635x435#", :small => "150x150#" },
                      :storage => :ftp,
                      :path => "/:attachment/:attachment/:id/:style/:filename",
                      :url => "http://testimages.dezineconnect.com/:attachment/:attachment/:id/:style/:filename"

  acts_as_xapian :texts => [ :specialization, :secondary_specializations_1,
                             :secondary_specializations_2, :experience_years,
                             :experience_months, :professional_level, :education, :awards_won_1, :awards_won_2, :awards_won_3,
                             :awards_won_4, :awards_won_5, :availability_1, :availability_2, :availability_3, :availability_4,
                             :city, :state, :country, :facebook, :twitter, :linkedin, :custom_url, :privacy_settings,
                             :themes, :bio, :profile_photo_file_name, :featured_photo_file_name
                           ],
       :values => [ [ :created_at, 0, "created_at", :date ], [ :updated_at, 1, "updated_at", :date ] ]

  belongs_to :user
  has_many :images
  def self.per_page
    5
  end
end
