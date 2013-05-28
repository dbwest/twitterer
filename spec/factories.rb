FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "Jane Stepford #{n}" }
		sequence(:email) { |n| "Jane_Stepford_#{n}@stepfordwives.org" }
		sequence(:username) { |n| "Clone#{n}" }
		sequence(:password) { "IamAclone"}
		sequence(:password_confirmation) { "IamAclone"}
	end
	factory :tweet do
		sequence(:tweet) {|n| "Tweet #{n}"}
		user
	end
end