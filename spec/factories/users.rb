FactoryGirl.define do
	factory :user do
		email Faker::Internet.free_email
		password Faker::Lorem.characters(8)
	end
end