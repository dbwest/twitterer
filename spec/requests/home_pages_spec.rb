require 'spec_helper'

describe "HomePages" do
	subject {page}
	before { visit root_path }
	it {should have_content('Welcome')}
	it {should have_selector('div', class: 'hero-unit')}
	it {should have_selector('div', class: 'row')}
	it {should have_selector('a', type: 'submit')}

	describe "navigation" do
		describe "click signup" do
			before {find_button('Sign up').click}
			# current_path.should == sign_up_path
		end

		describe "click signin" do
			before {find_button('Sign in').click}

		end
	end
end 

describe "Form pages" do
	subject {page}

	describe "Sign up" do
		before {visit new_user_path}
		describe "page elements" do
			it {should have_content('Create your account')}
			it {should have_selector('input', type: 'text', id: 'name', placeholder: 'First Last')}
			it {should have_selector('input', type: 'text', id: 'username', placeholder: 'username')}
			it {should have_selector('input', type: 'text', id: 'email', placeholder: 'email')}
			it {should have_selector('input', type: 'password', id: 'password', placeholder: 'password')}
			it {should have_selector('input', type: 'password', id: 'password-confirmation', placeholder: 'confirm your password')}
			it {should have_selector('input', type: 'button', id: 'submit-button')}
		end
		describe "on post" do
			describe "with valid information" do
				before do
					visit new_user_path
					fill_in "Name",	with: "Bob Baxter"
					fill_in "Username", with: "Bobby"
					fill_in "Email", with: "Bobby@bobbyb.com"
					fill_in "Password", with: "bobbaxter"
					fill_in "Password confirmation", with: "bobbaxter"
				end

				it "should change user count" do
					expect{click_button "Create"}.to change(User, :count).by(1)
				end
			end
			describe "without valid information" do
				before do
					visit new_user_path
					fill_in "Name",	with: "a" * 51
					fill_in "Username", with: "Bobby" * 4
					fill_in "Email", with: "Bobby@bobbyb.com" * 2
					fill_in "Password", with: "bob"
					fill_in "Password confirmation", with: "bobbaxter"
				end

				it "should change user count" do
					expect{click_button "Create"}.not_to change(User, :count)
				end

				it "should display an error message" do
					click_button "Create"
					page.should have_content("error")
				end

			end

		end
	end

	describe "Sign in" do
		before {visit new_session_url}
		describe "page elements" do
			it {should have_selector('input', type: 'text', id: 'username', placeholder: 'username')}
			it {should have_selector('input', type: 'password', id: 'password', placeholder: 'password')}
			it {should have_selector('input', type: 'button', id: 'submit-button')}
		end
		describe "validation" do
		end
	end
end

describe "Form actions" do
end