FactoryGirl.define do
	factory :static_page do
		title Faker::Lorem.word
		body Faker::Lorem.paragraph
	end
end