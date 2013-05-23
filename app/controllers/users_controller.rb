class UsersController < ApplicationController
	def index
		@users = User.all
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(params[:user])
		if @user.save
	      flash[:success] = "yaay"
		else
		  flash[:error] = "error"
	    end
	    redirect_to '/users/index'
	end
	def show
	end
	def edit
	end
	def destroy
	end
end
