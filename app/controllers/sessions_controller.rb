class SessionsController < ApplicationController
	def new
	end
	def create
		@user = User.find_by_username(params[:session][:username].downcase)
		redirect_to root_path
	end
	def destroy
		
	end
end
