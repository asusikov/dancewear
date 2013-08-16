def assert_items(items)
	items_ids = page.all('tbody tr td:first').map do |element|
  	element.text
  end
  items_ids.should == items.map { |item| item.id.to_s }
end

Then /^all (.*?) should be shown in table$/ do |model_name|
  model = model_name.singularize.tr(' ', '_').classify.constantize
  assert_items model.order('created_at desc')
end

Then /^only (\d+) last (\S*?) should be shown in table$/ do |count_shown_items, model_name|
	model = model_name.singularize.classify.constantize
  assert_items model.order('created_at desc').limit(count_shown_items.to_i)
end

Then /^(.*?) since (\d+) to (\d+) should be shown in table$/ do |model_name, min, max|
  min = min.to_i
  max = max.to_i
  model = model_name.singularize.classify.constantize
  assert_items model.order('created_at desc').limit(max - min + 1).offset(min - 1)
end

When /^I click by (.*?) title$/ do |model_name|
  click_link created_model(model_name).title
end

Then /^(.*?) of(?:| new) (.*?) should be equaled "(.*?)"$/ do |field, model_name, title|
  created_model(model_name).reload.send(field).should == title
end

Then /^(.*?) of (.*?) should be with error message$/ do |field_name, model_name|
  page.should have_css(".control-group.#{model_name}_#{field_name}.error")
end

Then(/^I should see (.*?) flash message$/) do |message_type|
  page.should have_css(".alert-#{message_type}")
end

Then(/^I should see navbar$/) do
  page.should have_css(".nav-tabs")
end