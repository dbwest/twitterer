class SessionsController < ApplicationController
	def new
	end
	def create
		user = User.find_by_username(params[:session][:username].downcase)
		if user && user.authenticate(params[:session][:password])
			start_session(user)
			redirect_to user_path(user)
		else
			redirect_to root_path
		end
	end
	def destroy
		end_session
		redirect_to root_path
	end
end
 