require "spec_helper"

describe ApplicationHelper do
	describe '#conditional_class' do
		it 'returns hash that include :class and value include key hash if value is true' do
			helper.conditional_class('main', :open => true).should == { :class => 'main open' }
		end
		it 'returns hash that include :class and value does not include key hash if value is false' do
			helper.conditional_class('main', :open => false).should == { :class => 'main' }
		end
		it 'passings many parameters' do
			helper.conditional_class('main', :open => false, :active => true, :second => true).should == { :class => 'main active second' }
		end
		it 'does not needing for main class' do
			helper.conditional_class(:open => true).should == { :class => 'open' }
		end
	end
end
