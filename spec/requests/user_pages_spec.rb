require 'spec_helper'

describe "UserPages" do
	describe "user profile pages" do
		before {visit user_path(user.id)}
		let(:user) {FactoryGirl.create(:user)}
		subject {page}
		it {should have_content(user.username)}
	end
	describe "if logged in" do
		let(:user) {FactoryGirl.create(:user)}
		let(:other_user) {FactoryGirl.create(:user)}
		before do
			sign_in(user)
		end
		it "should show edit page" do
			visit edit_user_path(user)
			page.should have_content("Please Edit")
			page.should have_content(user.username)
		end
		it "should only show edit page for current user" do
			visit edit_user_path(other_user)
			page.should_not have_content("Please Edit")
		end
	end
	describe "if not logged in" do
		let(:example_user) {FactoryGirl.create(:user)}

		it "should not show edit page" do
			visit edit_user_path(example_user)
			page.should_not have_content(example_user.username)
		end
		it "should not have a sign out link" do
			page.should_not have_link("Sign Out")
		end
	end

end