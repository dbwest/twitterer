class User < ActiveRecord::Base
  # Source for email validation inspiration:
  # http://my.rails-royce.org/2010/07/21/email-validation-in-ruby-on-rails-without-regexp/
  attr_accessible :email, :name, :username, :password, :password_confirmation
  has_secure_password
  has_many :tweets

  before_save :get_cookie

  validates :name, length: {maximum: 50}
  validates :username, length: {maximum: 15}, uniqueness: true
  validates :email, email: true
  validates :password, presence: { on: :create }, length: { minimum: 8 }

  private

  	def get_cookie
   		self.token = SecureRandom.urlsafe_base64
   	end
end
