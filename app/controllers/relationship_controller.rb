class RelationshipController < ApplicationController
	def create
		@user = User.find(params[:relationship][:followed_id])
		current_user.follow!(@user)
		
	end
end
