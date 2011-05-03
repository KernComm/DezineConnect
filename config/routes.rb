ActionController::Routing::Routes.draw do |map|

#map.reources :job_posting_details
  map.resources :assets

    map.resources :favourites

  #  map.resources :design_directories
map.connect '/jobs.js', :controller => "jobs", :action => "index"
map.connect '/design_directories.js', :controller => "design_directories", :action => "index"
 map.connect 'directory', :controller => 'design_directories', :action => 'index'
  
    map.connect 'directory/:custom_url', :controller => 'design_directories', :action => 'redirect'

      map.resources :users

        map.resource  :session

	  map.resources :job_applications

	    map.resources :job_postings

	      map.resources :images



	        map.activate  '/activate/:activation_code', :controller => 'users', :action => 'activate'
		  map.signup    '/signup', :controller => 'users', :action => 'new'
		    map.login     '/login', :controller => 'users', :action => 'login'
		      map.logout    '/logout', :controller => 'users', :action => 'logout'
		        map.forgot    '/forgot', :controller => 'users', :action => 'forgot'
			  map.reset     'reset/:reset_code', :controller => 'users', :action => 'reset'



			    
			      map.connect '/portfolios.js', :controller => "portfolios", :action => "index"
			        
  map.resources :blogs
  map.connect '/dlog/neil_dantas', :controller => "blogs", :action => "show", :id => 2
  map.connect '/dlog/achyutha_sharma', :controller => "blogs", :action => "show", :id => 16
  map.connect '', :controller =>"redirect", :action => "blank"
  map.connect '/about', :controller => "blogs", :action => "about"
  map.connect '/contact', :controller => "blogs", :action => "contact"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action.:format'
  map.connect '/dlog/Sandip_Paul', :controller => "blogs", :action => "show", :id => 5
  map.connect '/dlog/atom.xml', :controller => "blogs", :action => "index", :format => "rss"
map.connect '/dlog/rupesh_vyas', :controller => "blogs", :action => "show", :id => 13
  map.connect '/jobs.rss', :controller => "jobs", :action => "index", :format => "rss"
  map.connect '/dlog/neil_dantas', :controller => "blogs", :action => "show", :id => 2
  map.connect '/dlog/neha_ramaiya', :controller => "blogs", :action => "show", :id => 3
  map.connect '/dlog/rahul_mishra', :controller => "blogs", :action => "show", :id => 4
  map.connect '/dlog/suresh_eriyat', :controller => "blogs", :action => "show", :id => 6
  map.connect '/dlog/satya_rajpurohit', :controller => "blogs", :action => "show", :id => 7
  map.connect '/dlog/rajesh_dahiya', :controller => "blogs", :action => "show", :id => 8
map.connect '/dlog/kranthi_kiran', :controller => "blogs", :action => "show", :id => 15
map.connect '/dlog/satyajeet_kumar', :controller => "blogs", :action => "show", :id => 9
map.connect '/dlog/anusha_yadav', :controller => "blogs", :action => "show", :id => 11
map.connect '/dlog/designdaku', :controller => "blogs", :action => "show", :id => 10
map.connect '/dlog/vidyadhar_pande', :controller => "blogs", :action => "show", :id => 12
map.connect '/legal', :controller => "blogs", :action => "legal"
map.connect '/dlog/sunali_aggarwal', :controller => "blogs", :action => "show", :id => 14
map.connect '/dlog', :controller => "blogs", :action => "index"
end
