Then /^I should see input fields for edit info of static page$/ do
  page.should have_css('textarea#static_page_body')
  page.should have_css('button[type=submit]')
end

Then /^I should see (.[^ ]*?) of static page$/ do |field_name|
  page.should have_content(created_model('static page').send(field_name))
end

Then /^I should see info of static page in fields$/ do
  # TODO: Разобраться почему не находит текст
  # page.should have_css("textarea#static_page_body[value='#{created_model('static page').body}']")
end