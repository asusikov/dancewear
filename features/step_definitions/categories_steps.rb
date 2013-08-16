Then /^I should see categories from section "(.*)"$/ do |section_name|
	section = created_model("section \"#{section_name}\"")
  category_ids = page.all(".category").map { |element| element["data-category-id"] } 
  category_ids.should =~ section.categories.map { |item_category| item_category.id.to_s }
end

Then(/^I should see info of category$/) do
	model = created_model('category')
  page.should have_content(model.title)
  page.should have_content(model.section.title)
end

Then /^I should see categories from section "(.*)" in table$/ do |section_name|
  section = created_model("section \"#{section_name}\"")
  assert_items section.categories.order('created_at desc')
end

When(/^I click by section "(.*)" title in navbar$/) do |section_name|
  model = created_model("section \"#{section_name}\"")
  href = admin_section_categories_path(model)
  link = page.find(".nav-tabs a[href='#{href}']")
 	link.click
end

When(/^I click by section "(.*)" title in table$/) do |section_name|
  model = created_model("section \"#{section_name}\"")
  href = admin_section_categories_path(model)
  link = page.find("table a[href='#{href}']")
 	link.click
end

Then /^new category button should not be visible$/ do
  page.should_not have_css('.legend-button a.btn')
end

Then /^new category button should be visible$/ do
  page.should have_css('.legend-button a.btn')
end

Then /^I should see input fields for edit info of category$/ do
  page.should have_css('input#category_title')
  page.should have_css('button[type=submit]')
end

Then /^I should see info of category in fields$/ do
  page.should have_css("input#category_title[value='#{created_model('category').title}']")
end

Then /^all categories should be shown in navbar$/ do
  category_ids = page.all(".nav-tabs > li > a.category").map { |element| element['data-category-id'] }
  category_ids.should =~ Category.all.map { |item| item.id.to_s }
end