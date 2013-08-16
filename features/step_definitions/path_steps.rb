When /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then(/^I should be at (.+)$/) do |page|
  current_url.should =~ /#{path_to(page)}$/
end