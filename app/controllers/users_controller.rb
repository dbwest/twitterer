class UsersController < ApplicationController
	def index
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(params[:user])
		if @user.save
	      flash[:success] = "yaay"
	      render 'sign_up'
		  render user_path(@user.id)
		else
		    flash[:error] = "error"
	    end
	end
	def show
	end
	def edit
	end
	def destroy
	end
end
