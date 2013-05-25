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
		let(:other_user) {FactoryGirl.create(:user)}
		before do
			sign_in(user)
		end
		describe "tweet box" do
			describe "posting a message" do
				let(:user) {FactoryGirl.create(:user)}
				before {visit user_path(user.id)}
				subject {page}
				it {should have_selector("div", text: "Post Tweet")}
				it {should have_selector("input", type: "text-field")}
			end
		end
	end
	describe "if not logged in" do
		let(:example_user) {FactoryGirl.create(:user)}
	end
	

end