FactoryGirl.define do
	factory :good do
		sequence :title do |index|
			"Good #{index}"
		end
		sequence :created_at do |index|
			Time.now.midnight + index
		end
		association :category
		announcement Faker::Lorem.paragraph
		description Faker::Lorem.paragraph
		price Random.rand(1000)
		avatar { fixture_file_upload(Rails.root.join('spec', 'factories', 'images', 'rails.png'), 'image/png') }
	end
end