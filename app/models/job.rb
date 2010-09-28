class Job < ActiveRecord::Base
  has_many :job_applications
  belongs_to :user
  acts_as_xapian :texts => [ :job_title, :company_name,
                             :location, :job_description,
                             :how_to_apply_email, :created_at, :updated_at, :activate, :activation_key,
                             :email
                           ],
       :values => [ [ :created_at, 0, "created_at", :date ], [ :updated_at, 1, "updated_at", :date ] ]
end
