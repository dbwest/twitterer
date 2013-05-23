class HomePagesController < ApplicationController
  def home
  end

  def about
  end

  def sign_up
    redirect_to '/user'
  end

  def sign_in
  	# redirect_to new_session
  end
end
