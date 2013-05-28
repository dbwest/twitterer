require 'spec_helper'

describe "UserPages" do
	subject {page}

	describe "profile page" do
		let(:user) {FactoryGirl.create(:user)}
		before do
			sign_in user
			visit user_path(user)}
		end
  
		it { should have_selector('h1', text: user.name)}
		it { should have_selector('title', text: user.name)}

		describe "follow unfollow buttons" do
			let(:other_user) {FactoryGirl.create(:user)}

			describe "following another user" do
				before {visit user_path(other_user)}

				it "should increment the followed user count" do
					expect do
						click_button "Follow"
					end.to change(user.followed_users, :count).by(1)
				end

				it "should increment the other user's followers count" do
					expect do
						click_button "Follow"
					end.to change(other_user.followers, :count).by(1)
				end

				describe "toggling the button" do
					before {click_button "Follow"}
					it {should have_selector('input', value: 'Unfollow')}
				end
			end

			describe "unfollowing a user" do
				before do
					user.follow!(other_user)
					visit user_path(other_user)
				end

				it "should decrement the followed user count" do
					expect do
						click_button "Unfollow"
					end.to change(user.followed_users, :count).by(-1)
				end

				it "should decrement the other user's followers count" do
					expect do
						click_button "Unfollow"
					end.to change(other_user.followers, :count).by(-1)
				end

				describe "toggling the button" do
					before { click_button "Unfollow"}
					it{should have_selector('input', value: 'Follow')}
				end
			end
		end
	end
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
		describe "home page" do
			before do
				sign_in user
				visit "/users"
				click_link "Home"
			end
			it {page.should have_content "Your Timeline"}
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

	describe "FollowUnfollows" do
		describe "Post to /relationships" do
			let (:other_user) {FactoryGirl.create(:user)}
			let (:user) {FactoryGirl.create(:user)}
			before do
				sign_in user
			end

			it "click Follow button" do
				visit user_path(other_user)
			end
		end
	end



end