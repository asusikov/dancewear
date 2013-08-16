include ActionDispatch::TestProcess

FactoryGirl.define do
	factory :post do
		sequence :title do |index|
			"Post ##{index}"
		end
		announcement Faker::Lorem.paragraph
		body Faker::Lorem.paragraph
		sequence :created_at do |index|
			Time.now.midnight + index
		end
		avatar { fixture_file_upload(Rails.root.join('spec', 'factories', 'images', 'rails.png'), 'image/png') }
	end
end