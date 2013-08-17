require "spec_helper"

describe Admin::AdminHelper do

	describe '#add_button' do
		it 'return twitter-bootstrap button with url for add new item' do
			url = Faker::Internet.url
			button = helper.add_button url
			button.should have_css("a.btn[href='#{url}']")
			button.should have_css("i[class='icon-plus']")
			button.should have_content(t('form.add'))
		end
	end

	describe '#edit_small_button' do
		it 'return twitter-bootstrap icon with url without text for edit item' do
			url = Faker::Internet.url
			button = edit_small_button url
			button.should have_css("a[href='#{url}']")
			button.should have_css("i[class='icon-pencil']")
			button.should_not have_content(t('form.edit'))
		end
	end

	describe '#edit_button' do
		it 'return twitter-bootstrap button with url with text for edit item' do
			url = Faker::Internet.url
			button = helper.edit_button url
			button.should have_css("a.btn[href='#{url}']")
			button.should have_css("i[class='icon-pencil']")
			button.should have_content(t('form.edit'))
		end
	end

	describe '#delete_small_button' do
		it 'return twitter-bootstrap icon with url without text for delete item' do
			url = Faker::Internet.url
			title = Faker::Lorem.sentence
			button = delete_small_button url, title
			confirm_text = t 'form.confirm_text', :title => title
			button.should have_css("a[href='#{url}'][data-confirm='#{confirm_text}'][data-confirm-title='#{t('form.confirm_delete')}']")
			button.should have_css("i[class='icon-trash']")
			button.should_not have_content(t('form.delete'))
		end
	end

	describe '#delete_button' do
		it 'return twitter-bootstrap button with url with text for delete item' do
			url = Faker::Internet.url
			title = Faker::Lorem.sentence
			button = delete_button url, title
			confirm_text = t 'form.confirm_text', :title => title
			button.should have_css("a.btn[href='#{url}'][data-confirm='#{confirm_text}'][data-confirm-title='#{t('form.confirm_delete')}']")
			button.should have_css("i[class='icon-trash']")
			button.should have_content(t('form.delete'))
		end
	end

	describe '#save_button' do
		it 'return submit button with class btn' do
			button = save_button
			button.should have_css("button.btn[type='submit']")
			button.should have_content(t('form.save'))
		end
	end

	describe '#cancel_button' do
		it 'return twitter-bootstrap button with url' do
			url = Faker::Internet.url
			button = cancel_button url
			button.should have_css("a.btn[href='#{url}']")
			button.should have_content(t('form.cancel'))
		end
	end

	describe '#show_form' do
		let(:item) { double() }
		it 'return div with class show-form' do
			content = show_form(item) { }
			content.should have_css('div.show-form')
		end
		it 'yield ShowForm instance' do
			obj = nil
			content = show_form(item) { |f| obj = f }
			obj.should be_kind_of(Admin::AdminHelper::ShowForm)
		end
	end

	describe Admin::AdminHelper::ShowForm do

		let :item do
			item = double(:title => Faker::Lorem.sentence, :custom_value => Faker::Lorem.sentence)
			RSpec::Mocks::Mock.stub(:human_attribute_name).with(:title).and_return('title')
			item
		end

		subject { Admin::AdminHelper::ShowForm.new item }

		describe '#text' do
			it 'return row with name of field and text value' do
				row = subject.text :title
				row.should have_css('div.row-fluid')
				row.should have_content('title')
				row.should have_content(item.title)
			end
		end
		describe '#custom_value' do
			it 'return with name of field and custom value' do
				row = subject.custom_value(:title) { |item| item.custom_value }
				row.should have_css('div.row-fluid')
				row.should have_content('title')
				row.should have_content(item.custom_value)
			end
		end
	end


end
