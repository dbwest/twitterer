class TweetsController < ApplicationController
	def create
		@tweet = current_user.tweets.build(tweet: params[:tweet])
		if @tweet.save
			flash[:success] = "Tweet posted"
		else
			flash[:error] = "Tweet not posted"
		end
		respond_to do |format|
			format.html { redirect_to current_user }
			format.js
		end
	end
	def index
	end
	def show
	end
end
