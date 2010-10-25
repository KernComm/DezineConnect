# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101025045935) do

  create_table "acts_as_xapian_jobs", :force => true do |t|
    t.string  "model",    :null => false
    t.integer "model_id", :null => false
    t.string  "action",   :null => false
  end

  add_index "acts_as_xapian_jobs", ["model", "model_id"], :name => "index_acts_as_xapian_jobs_on_model_and_model_id", :unique => true

  create_table "assets", :force => true do |t|
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assets", ["attachable_id", "attachable_type"], :name => "index_assets_on_attachable_id_and_attachable_type"

  create_table "blogs", :force => true do |t|
    t.text     "name"
    t.text     "blog_statement"
    t.text     "blog_content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author_photo_file_name"
    t.string   "author_photo_content_type"
    t.integer  "author_photo_file_size"
    t.datetime "author_photo_updated_at"
    t.text     "content_for_home_page"
    t.string   "author_photo_small_file_name"
    t.string   "author_photo_small_content_type"
    t.integer  "author_photo_small_file_size"
    t.datetime "author_photo_small_updated_at"
    t.text     "page_views"
    t.text     "extended_content"
    t.text     "tag"
    t.text     "vcard_mail"
    t.text     "vcard_phone"
    t.text     "vcard_skype"
    t.text     "vcard_website"
    t.text     "vcard_blog"
    t.text     "vcard_facebook"
    t.text     "vcard_twitter"
    t.text     "vcard_flickr"
    t.text     "vcard_linkedin"
    t.text     "vcard_youtube"
    t.text     "vcard_vimeo"
    t.text     "vcard_delicious"
    t.text     "below_slider_content_1"
    t.text     "below_slider_content_2"
    t.text     "below_slider_content_3"
    t.text     "below_slider_content_4"
  end

  create_table "design_directories", :force => true do |t|
    t.string   "company_name"
    t.text     "company_overview"
    t.text     "services"
    t.string   "staff_size"
    t.string   "year_founded"
    t.string   "custom_url"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "user_id"
    t.text     "display_name"
    t.text     "key_service"
    t.text     "other_service1"
    t.text     "other_service2"
    t.text     "other_service3"
    t.text     "clients1"
    t.text     "clients2"
    t.text     "clients3"
    t.text     "phone_number"
    t.text     "contact_email"
  end

  create_table "images", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.integer  "portfolio_id"
    t.text     "description"
    t.string   "set_name"
    t.string   "design_directory_id"
  end

  create_table "job_applications", :force => true do |t|
    t.text     "Name"
    t.text     "email"
    t.text     "specialization"
    t.text     "cover_letter"
    t.text     "resume_link"
    t.text     "portfolio_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.string   "portfolio_file_name"
    t.string   "portfolio_content_type"
    t.integer  "portfolio_file_size"
    t.boolean  "activate",               :default => false
    t.text     "activation_key"
    t.integer  "job_id"
    t.integer  "user_id"
  end

  create_table "job_posting_details", :force => true do |t|
    t.text     "job_poster"
    t.text     "job_source"
    t.text     "job_source_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "job_id"
    t.text     "job_poster_email"
  end

  create_table "jobs", :force => true do |t|
    t.text     "job_title"
    t.text     "company_name"
    t.text     "location"
    t.text     "job_description"
    t.text     "how_to_apply_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "activate",           :default => false
    t.text     "activation_key"
    t.text     "email"
    t.integer  "user_id"
  end

  create_table "payments", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "portfolios", :force => true do |t|
    t.string   "specialization"
    t.string   "secondary_specializations_1"
    t.string   "secondary_specializations_2"
    t.string   "experience_years"
    t.string   "experience_months"
    t.string   "professional_level"
    t.string   "education"
    t.string   "awards_won_1"
    t.string   "awards_won_2"
    t.string   "awards_won_3"
    t.string   "awards_won_4"
    t.string   "awards_won_5"
    t.string   "availability_1"
    t.string   "availability_2"
    t.string   "availability_3"
    t.string   "availability_4"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "custom_url"
    t.string   "privacy_settings"
    t.string   "themes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "bio"
    t.string   "profile_photo_file_name"
    t.string   "profile_photo_content_type"
    t.integer  "profile_photo_file_size"
    t.datetime "profile_photo_updated_at"
    t.string   "featured_photo_file_name"
    t.string   "featured_photo_content_type"
    t.integer  "featured_photo_file_size"
    t.datetime "featured_photo_updated_at"
    t.integer  "user_id"
    t.string   "user_firstname"
    t.string   "user_lastname"
    t.string   "availability_5"
    t.string   "website"
    t.string   "education_1"
    t.string   "education_2"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.text     "firstname"
    t.text     "lastname"
    t.text     "email"
    t.text     "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "activate",       :default => false
    t.text     "activation_key"
  end

end
