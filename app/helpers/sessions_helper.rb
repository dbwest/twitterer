module SessionsHelper
	def start_session(user)
		cookies.permanent[:token] = user.token
		self.current_user=user
	end
	def user_signed_in?
		!current_user.nil?
	end
	def current_user
		@current_user ||= User.find_by_token(cookies[:token])
	end
	def current_user=(user)
		@current_user=user
	end
	def end_session
		self.current_user=nil
		cookies.delete(:token)
	end
end
