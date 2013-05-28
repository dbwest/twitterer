class ApplicationController < ActionController::Base
  protect_from_forgery

  # Force signout to prevent CSRF attacks
  def handle_unverified_request
  	end_session
  	super
  end
end
