require "spec_helper"

describe Category do
	
	context '#validate' do
		it 'is not valid if title is empty' do
			build(:category, :title => '').should_not be_valid
		end
		it 'is valid if title is not empty' do
			build(:category, :title => 'New category').should be_valid
		end
	end

end
