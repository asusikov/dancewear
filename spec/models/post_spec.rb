require "spec_helper"

describe Post do
	
	context '#validate' do
		it 'is not valid if title is empty' do
			build(:post, :title => '').should_not be_valid
		end
		it 'is valid if title is not empty' do
			build(:post, :title => 'New post').should be_valid
		end
		it 'is not valid if announcement is empty' do
			build(:post, :announcement => '').should_not be_valid
		end
		it 'is valid if announcement is empty' do
			build(:post, :announcement => 'Announcement').should be_valid
		end
	end

end
