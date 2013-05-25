require 'spec_helper'

describe User do
	describe "Valid user" do
		let(:user) {FactoryGirl.create (:user)}

		subject {user}
		it {should respond_to(:name)}
		it {should respond_to(:username)}
		it {should respond_to(:email)}
		it {should respond_to(:password_digest)}
		it {should respond_to(:authenticate)}
		it {should respond_to(:token)}
		it {should respond_to(:tweets)}
		it {should respond_to(:relationships)}


		describe "has a valid name" do
			it "has a name of max 50 characters" do
				user.name = "a" * 51
				user.should_not be_valid
			end
		end

		describe "has a valid username" do
			it "has a username of max 15 characters" do
				user.username = "a" * 16
				user.should_not be_valid
			end
		end

		describe "has a valid email" do
			it "should have a valid format" do
				valid_emails = %w[fOO@bar.org foo.bar@foo.jp a+b@foo.com mr_foo-barr@foobar.net]
				valid_emails.each do |address|
					user.email = address
					user.should be_valid
				end
			end
			it "should not have an invalid format" do
				invalid_emails = %w[fOO_at_bar.org foo.bar@foo,jp a+b@foo.bar@com]
				invalid_emails.each do |address|
					user.email = address
					user.should_not be_valid
				end
			end
			it "has an email that is not nil or empty string" do
				user.email = nil
				user.should_not be_valid
				user.email = ""
				user.should_not be_valid
			end
		end

		describe "log in and authentication" do
			it "should reject invalid passwords" do
				password = "bad_password"
				user.authenticate(password).should be_false
			end
			
			it "should provide a valid user object after positive authentication" do
				password = user.password
				user.authenticate(password).should be_valid
			end

			describe "cookie" do
				its(:token) { should_not be_blank}
			end
		end

		describe "following and unfollowing" do
			let(:other_user) {FactoryGirl.create(:user)}
			before do
				user.follow!(other_user)
			end

			it { should be_following(other_user)}

		end

	end
end
