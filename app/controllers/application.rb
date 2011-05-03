# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
 require 'rubygems'
  # require 'twitter'
 def login_required
       if session[:is_admin].blank? then
             redirect_to '/login'
	         end
		   end
  
def is_registered_user
    if session[:loggedin_user].blank? then
          redirect_to '/login'
	      elsif Portfolio.find_by_user_id(session[:loggedin_user]).nil? or Portfolio.find_by_user_id(session[:loggedin_user]).blank? then
	            redirect_to '/login'
		        end
			  end

 def seend_tweet(message)
     token  = "1OwtA6XFzgT3DER5GZglnQ"
         secret = "TmUsK5uiAT3JlqWA5bWPcWCp0sI8VB0TX4ODwvAixk"
	     atoken = "199604836-WvWb2u4hixibybjN9fWGqiNrzQp0BYpibswh7uXP"
	         asecret = "47KStSmHJ5Fhn74XWvMmfDW3UdqGV0l2jm9KxsZpauE"
		 
		     oauth = Twitter::OAuth.new(token, secret)
		         oauth.authorize_from_access(atoken, asecret)
			 
			     client = Twitter::Base.new(oauth)
			     
			         client.inspect
				     client.update(message)
				       end
				       
			#	       ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  # protect_from_forgery # :secret => 'f7dad2d970a733648bae33f7472f8881'

  #around_filter :you_dont_have_bloody_clue

  protected

  def you_dont_have_bloody_clue
    klasses = [ActiveRecord::Base, ActiveRecord::Base.class]
    methods = ["session", "cookies", "params", "request"]

    methods.each do |shenanigan|
      oops = instance_variable_get(:"@_#{shenanigan}")

      klasses.each do |klass|
        klass.send(:define_method, shenanigan, proc { oops })
      end
    end

    yield

    methods.each do |shenanigan|
      klasses.each do |klass|
        klass.send :remove_method, shenanigan
      end
    end

  end

end
