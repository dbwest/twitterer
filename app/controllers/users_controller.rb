class UsersController < ApplicationController
	before_filter :signed_in_user, only: [:edit]
	before_filter :current_user, only: [:edit]

	def index
		@users = User.all
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(params[:user])
		if @user.save
	      redirect_to '/users'
		else
		  redirect_to '/users/new'
	    end
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
