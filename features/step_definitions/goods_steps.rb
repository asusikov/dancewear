# -*- encoding : utf-8 -*-
When /^I visit goods index page number (\d+)$/ do |page|
  visit goods_path(:page => page)
end

When /^I visit admin goods page number (\d+)$/ do |page|
  visit admin_goods_path(:page => page)
end

def assert_goods(goods)
  goods_ids = page.all(".good").map { |element| element["data-good-id"] } 
  goods_ids.count.should == goods.count
  goods_ids.should == goods.map { |item_good| item_good.id.to_s }
end

Then /^only (\d+) last goods (.*)should be shown$/ do |count_shown_goods, goods_type|
  if goods_type.strip =~ /from (category .*)/ then
    category = created_model($1) 
    goods = category.goods.order('created_at desc')
  elsif goods_type.strip =~ /from (section .*)/ then
    section = created_model($1)  
    goods = Good.joins(:category).where(:categories => { :section_id => section.id }).order('created_at desc')
  else
    goods = Good.order('created_at desc')
  end
  count_shown_goods = count_shown_goods.to_i
  assert_goods goods[0, count_shown_goods]
end

Then /^goods since (\d+) to (\d+) should be shown$/ do |min, max|
  count_shown_goods = max.to_i - min.to_i + 1
  assert_goods Good.order('created_at desc').limit(count_shown_goods).offset(min.to_i - 1)
end

Then(/^I should see goods link$/) do
  page.should have_css(".navbar a[href='#{admin_goods_path}']")
end

When(/^I click by category "(.*?)" title in navbar on goods page$/) do |category_name|
  model = created_model("category \"#{category_name}\"")
  href = admin_section_category_goods_path(model.section, model)
  link = page.find(".nav-tabs a[href='#{href}']")
  link.click
end

Then(/^link to section (.*?) in navbar should be active$/) do |section_name|
  model = created_model("section #{section_name}")
  href = admin_section_goods_path(model)
  page.should have_css(".nav-tabs > li.active > a[href='#{href}']")
end

Then(/^link to category (.*?) in navbar should be active$/) do |category_name|
  model = created_model("category #{category_name}")
  href = admin_section_category_goods_path(model.section, model)
  page.should have_css(".nav-tabs > li.active > a[href='#{href}'].category")
end

Then /^only (\d+) last goods from category (.*?) should be shown in table$/ do |count_shown_items, category_name|
  category = created_model("category #{category_name}")
  assert_items category.goods.order('created_at desc').limit(count_shown_items.to_i)
end

Then /^only (\d+) last goods from section (.*?) should be shown in table$/ do |count_shown_items, section_name|
  section = created_model("section #{section_name}")
  assert_items Good.joins(:category).where(:categories => { :section_id => section.id }).order('created_at desc').limit(count_shown_items.to_i)
end

Then /^I should see full info of good$/ do
  extend ActionView::Helpers::NumberHelper
  model = created_model('good')
  page.should have_content(model.title)
  page.should have_content(model.category.title)
  page.should have_content(model.announcement)
  page.should have_content(model.description)
  page.should have_content(number_to_currency(model.price, :precision => 0))
end

Then /^I should see input fields for edit info of good$/ do
  page.should have_css('input#good_title')
  page.should have_css('input#good_price')
  page.should have_css('textarea#good_announcement')
  page.should have_css('textarea#good_description')
  page.should have_css('button[type=submit]')
end

Then /^I should see info of good in fields$/ do
  page.should have_css("input#good_title[value='#{created_model('good').title}']")
end

Then /^I should see (.*?) avatar of good$/ do |avatar_type|
  src = "#{created_model('good').avatar.url(avatar_type.to_sym)}"
  page.should have_css("img[src='#{src}']")
end

Then /^I should see (.[^ ]*?) of good$/ do |field_name|
  if field_name == 'price'
    extend ActionView::Helpers::NumberHelper
    price = number_to_currency(created_model('good').send(field_name), :precision => 0)
    page.should have_content(price)
  else
    page.should have_content(created_model('good').send(field_name))
  end
end

Then /^I should see default announcement$/ do
  page.should have_content('Краткое описание отсутствует')
end

Then(/^only (\d+) last goods should be shown in carousel$/) do |count_goods|
  count_goods = count_goods.to_i
  goods_ids = page.all('.carousel .item').map { |element| element['data-good-id'] }
  goods_ids.count.should == count_goods
  goods_ids.should == Good.order('created_at desc').limit(count_goods).map { |item| item.id.to_s }
end

When(/^I click by good in carousel$/) do
  href = good_path(created_model('good'))
  link = page.find(".carousel a[href='#{href}']")
  link.click
end

Then /^I should see default good's (.*?) avatar$/ do |avatar_type|
  src = "/assets/default_good_avatar_#{avatar_type}.png"
  page.should have_css("img[src='#{src}']")
end

Then(/^(.*?) "(.*?)" should be current in navbar$/) do |model_type, model_name|
  model = created_model("#{model_type} \"#{model_name}\"")
  page.should have_css("li.active > a[data-#{model_type}-id='#{model.id}']")
end

Then(/^(.*?) "(.*?)" should be current in menu$/) do |model_type, model_name|
  model = created_model("#{model_type} \"#{model_name}\"")
  page.should have_css(".#{model_type}.active[data-#{model_type}-id='#{model.id}']")
end