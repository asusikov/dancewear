Then(/^I should see log in form$/) do
  page.should have_css('form[action="/user/sign_in"]')
end

Then /^I should see form elements for log in$/ do
  page.should have_css('input#user_email')
  page.should have_css('input#user_password')
end

When /^I log in$/ do
	user = FactoryGirl.create(:user)
	fill_in "user_email", :with => user.email
  fill_in "user_password", :with => user.password
  click_button I18n.t('log_in')
end

Given /^I log out$/ do
  page.driver.submit :delete, destroy_user_session_path, {}
end

Given /^I am not authenticated$/ do
  step "I log out" 
end

Given /^I am a new, authenticated user$/ do
  visit new_user_session_path
  step "I log in" 
end