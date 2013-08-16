FactoryGirl.define do
	factory :section do
		sequence :title do |index|
			"Section #{index}"
		end
	end
end