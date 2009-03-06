# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '83f34becd14eff51a11d0ede181e8f7f'
  include AuthenticatedSystem
  include TreelatorLib 
  before_filter :set_locale

  def set_locale
    #TODO write this function (set_locale)
    if session[:locale].nil?
      session[:locale] = Locale.first
    end
    
    if params[:locale_id]
      session[:locale] = Locale.find(params[:locale_id])
    end
    
  end
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
end
