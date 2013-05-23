class User < ActiveRecord::Base
  # Source for email validation inspiration:
  # http://my.rails-royce.org/2010/07/21/email-validation-in-ruby-on-rails-without-regexp/
  attr_accessible :email, :name, :user_id, :username, :password, :password_confirmation
  has_secure_password

  validates :name, length: {maximum: 50}
  validates :username, length: {maximum: 15}
  validates :email, email: true
  validates :password, presence: { on: :create }, length: { minimum: 8 }

  
end
