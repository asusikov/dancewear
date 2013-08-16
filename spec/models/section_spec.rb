require "spec_helper"

describe Section do
	
	context '#validate' do
		it 'is not valid if title is empty' do
			build(:section, :title => '').should_not be_valid
		end
		it 'is valid if title is not empty' do
			build(:section, :title => 'New section').should be_valid
		end
	end

end
