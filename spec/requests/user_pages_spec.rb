require 'spec_helper'

describe "UserPages" do
	describe "user profile pages" do
		let(:user) {FactoryGirl.create(:user)}
		before {visit user_path(user)}
		subject {page}
		it {should have_content(user.username)}
	end
	describe "if logged in" do
		let(:user) {FactoryGirl.create(:user)}
		before do
			sign_in(user)
		end
		describe "it should have a tweet box" do
			describe "posting a message" do
				let(:user) {FactoryGirl.create(:user)}
				before {visit user_path(user.id)}
				subject {page}
				it {should have_selector("input", type: "text-field")}
			end
		end
		describe "on another users page" do
			let(:user) {FactoryGirl.create(:user)}
			let(:other_user) {FactoryGirl.create(:user)}
			before do
				sign_in user
				visit user_path(other_user)
			end
			subject{page}
			it "should follow user after clicking button and unfollow after that" do
				expect {click_button "Follow"}.to change(other_user.followers, :count).by(1)
				expect {click_button "Unfollow"}.to change(other_user.followers, :count).by(-1)
				expect {click_button "Follow"}.to change(user.followed_user, :count).by(1)
				expect {click_button "Unfollow"}.to change(user.followed_users, :count).by(-1)
			end
		end
	end
	describe "if not logged in" do
		describe "on another users page" do
			let(:user) {FactoryGirl.create(:user)}
			let(:other_user) {FactoryGirl.create(:user)}
			before do
				visit user_path(other_user)
			end
			subject{page}
		end
	end
	

end