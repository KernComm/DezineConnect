class Image < ActiveRecord::Base
  has_attached_file :image, :convert_options => {
    :all => "-depth 8 -density 96 -resample 96x96 -colorspace RGB",
    :negative => "-negate"
  },
    :styles => { :original => "635x435", :thumb => "150x150#" },
    :storage => :ftp,
    :path => ":id_:style_:basename.:extension",
    :url => "http://images.dezineconnect.com/Dezineconnect/:id_:style_:basename.:extension"

  belongs_to :portfolio
end
