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
		  start_session(@user)
	      redirect_to '/users'
		else
		  redirect_to '/users/new'
	    end
	end
	def show
		@user = User.find(params[:id])
	end
	def edit
		@user = current_user
	end
	def destroy
	end

	private
		def signed_in_user
			unless user_signed_in?
				redirect_to signin_url
				flash[:notice] = "Please log in first"
			end
		end

		def current_user
			@user = User.find(params[:id])
			redirect_to root_path unless current_user?(user)
		end

end
