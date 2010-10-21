ActionController::Routing::Routes.draw do |map|
  map.resources :job_posting_details

  map.resources :job_applications
  
  map.resources :payments

  map.resources :company_images

  map.resources :assets

  map.resources :favourites

  map.resources :users

  map.resource  :session

  map.resources :images

  map.connect 'directory', :controller => 'design_directories', :action => 'index'
 
  map.connect 'directory/:custom_url', :controller => 'design_directories', :action => 'redirect'

  map.activate  '/activate/:activation_code', :controller => 'users', :action => 'activate'
  map.signup    '/signup', :controller => 'users', :action => 'new'
  map.login     '/login', :controller => 'users', :action => 'login'
  map.logout    '/logout', :controller => 'users', :action => 'logout'
  map.forgot    '/forgot', :controller => 'users', :action => 'forgot'
  map.forgot    '/forgot_confirmation', :controller => 'users', :action => 'forgot_confirmation'
  map.reset     'reset/:reset_code', :controller => 'users', :action => 'reset'

  
  map.connect '', :controller => "redirect", :action => "blank"
  map.connect '/admin/panel', :controller => "admin", :action => "panel"
  map.connect '/dlog/atom.xml', :controller => "blogs", :action => "index", :format => "rss"
  map.connect '/dlog/neil_dantas', :controller => "blogs", :action => "show", :id => 4
  map.connect '/dlog/neha_ramaiya', :controller => "blogs", :action => "show", :id => 16
  map.connect '/dlog/rahul_mishra', :controller => "blogs", :action => "show", :id => 17
  map.connect '/dlog/Sandip_Paul', :controller => "blogs", :action => "show", :id => 19
  map.resources :blogs
  map.connect '/dlog/suresh_eriyat', :controller => "blogs", :action => "show", :id => 20
  map.connect '/dlog/satya_rajpurohit', :controller => "blogs", :action => "show", :id => 21
  map.connect '/dlog/rajesh_dahiya', :controller => "blogs", :action => "show", :id => 22
  map.connect '/dlog/satyajeet_kumar', :controller => "blogs", :action => "show", :id => 25
  map.connect '/dlog/designdaku', :controller => "blogs", :action => "show", :id => 26
  map.connect '/dlog/anusha_yadav', :controller => "blogs", :action => "show", :id => 11
  map.connect '/dlog', :controller => "blogs", :action => "index"

  
  map.connect '/portfolios.js', :controller => "portfolios", :action => "index"
  map.connect '/jobs.js', :controller => "jobs", :action => "index"
  map.connect '/design_directories.js', :controller => "design_directories", :action => "index"
  
  map.connect '/about', :controller => "blogs", :action => "about"
  map.connect '/contact', :controller => "blogs", :action => "contact"
  map.connect '/legal', :controller => "blogs", :action => "legal"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action.:format'
  map.connect ':controller/:action/:id.:format'
  




end
