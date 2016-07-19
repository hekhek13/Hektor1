FactoryGirl.define do
	sequence(:email) { |n| "user#{n}@example.com" }
	factory :user do
		email 
		password "testtest"
		first_name "Bartolomew"
		last_name "Example"
		admin false
	end

end