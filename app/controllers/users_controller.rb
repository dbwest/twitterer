class UsersController < ApplicationController
	def index
		@users = User.all
	end
	def new
		@user = User.new
	end
	def create
	end
	def show
		@user = User.find(params[:id])
		@tweets = @user.tweets
	end
	def edit
		@user = current_user
	end
	def destroy
	end
	
end
