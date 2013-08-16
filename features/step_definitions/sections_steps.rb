# -*- encoding : utf-8 -*-

Then /^I should see info of section in fields$/ do
  page.should have_css("input#section_title[value='#{created_model('section').title}']")
end

Then /^I should see input fields for edit info of section$/ do
  page.should have_css('input#section_title')
  page.should have_css('button[type=submit]')
end

Then /^I should see info of section$/ do
  page.should have_content(created_model('section').title)
end

Then /^I should see all sections$/ do
  sections_ids = page.all('.section').map { |element| element['data-section-id'] }
  sections_ids.should =~ Section.all.map { |item_section| item_section.id.to_s }
end

Then(/^all sections should be shown in navbar$/) do
  sections_ids = page.all(".nav-tabs > li > a:not(.category)").map { |element| element['data-section-id'] }
  sections_ids.should =~ Section.all.map { |item_section| item_section.id.to_s }
end

When(/^I click by section "(.*)" title in navbar on goods page$/) do |section_name|
  model = created_model("section \"#{section_name}\"")
  href = admin_section_goods_path(model)
  link = page.find(".nav-tabs a[href='#{href}']")
  link.click
end
