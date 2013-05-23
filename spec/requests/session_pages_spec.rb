require 'spec_helper'

describe "SessionsPages" do

	subject { page }

	describe "signin" do
		
		before{visit signin_path}

		it {should have_content('Log In')}	

	end

end
