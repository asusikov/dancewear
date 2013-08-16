# -*- encoding : utf-8 -*-
When /^I click by edit (.*?) button$/ do |model_name|
  if model_name == 'category'
    model = created_model(model_name)
    path = "edit_admin_section_#{model_name}_path"
    href = send(path, model.section, model)
  elsif model_name == 'good'
    model = created_model(model_name)
    path = "edit_admin_section_category_#{model_name}_path"
    href = send(path, model.category.section, model.category, model)
  else
    model_name = model_name.split(' ').join('_')
  	model = created_model(model_name)
  	path = "edit_admin_#{model_name}_path"
    href = send(path, model)
  end
  link = page.find("a[href='#{href}']")
  link.click
end

When /^I click by destroy (.*?) button$/ do |model_name|
  if model_name == 'category'
    model = created_model(model_name)
    path = "admin_section_#{model_name}_path"
    href = send(path, model.section, model)
  elsif model_name == 'good'
    model = created_model(model_name)
    path = "admin_section_category_#{model_name}_path"
    href = send(path, model.category.section, model.category, model)
  else
  	model = created_model(model_name)
  	path = "admin_#{model_name}_path"
    href = send(path, model)
  end
  link = page.find("a[href='#{href}'][data-method='delete']")
  link.click
end

When /^I click by new button$/ do
  click_link I18n.t('form.add')
end

When /^I click back button$/ do
  click_link I18n.t('form.cancel')
end

When /^I click save button$/ do
	button = page.find('button[type=submit]')
  button.click
end

Given /^I input "(.*?)" in (.*?) of (.*?)$/ do |value, field, model_name|
  model_name = model_name.split(' ').join('_')
  fill_in "#{model_name}[#{field}]", :with => value
end
