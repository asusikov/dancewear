FactoryGirl.define do
	factory :category do
		sequence :title do |index|
			"Category #{index}"
		end
		association :section
	end
end