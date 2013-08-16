# -*- encoding : utf-8 -*-

When /^I visit posts page number (\d+)$/ do |page|
  visit posts_path(:page => page)
end

When /^I visit admin posts page number (\d+)$/ do |page|
  visit admin_posts_path(:page => page)
end

def assert_posts(posts)
  posts_ids = page.all(".post").map { |element| element['data-post-id'] }
  posts_ids.count.should == posts.count
  posts_ids.should == posts.map { |item_posts| item_posts.id.to_s }
end

Then /^only (\d+) last posts should be shown$/ do |count_shown_posts|
  assert_posts Post.order('created_at desc').limit(count_shown_posts.to_i)
end

Then /^posts since (\d+) to (\d+) should be shown$/ do |min, max|
  min = min.to_i
  max = max.to_i
  assert_posts Post.order('created_at desc').limit(max - min + 1).offset(min - 1)
end

Then /^I should see full info of post$/ do
  post = created_model('post')
  page.should have_content(post.title)
  page.should have_content(post.announcement)
  page.should have_content(post.body)
end

Then /^I should see input fields for edit info of post$/ do
  page.should have_css('input#post_title')
  page.should have_css('textarea#post_body')
  page.should have_css('textarea#post_announcement')
  page.should have_css('button[type=submit]')
end

Then /^I should see info of post in fields$/ do
  page.should have_css("input#post_title[value='#{created_model('post').title}']")
  # TODO: Разобраться почему не находит текст
  # page.should have_css("textarea#post_body[value='#{created_model('post').body}']")
end

Then /^I should see (.[^ ]*?) of post$/ do |field_name|
  if field_name == 'avatar'
    src = "#{created_model('post').avatar.url(:thumb)}"
    page.should have_css("img[src='#{src}']")
  else
    page.should have_content(created_model('post').send(field_name))
  end
end

Then /^I should see default post's avatar$/ do
  src = "/assets/default_post_avatar.png"
  page.should have_css("img[src='#{src}']")
end

Then /^I should not see details link$/ do
  page.should_not have_content(I18n.t('details'))
end

Then /^I should see details link$/ do
  page.should have_content(I18n.t('details'))
end

When /^click details link$/ do
  click_link I18n.t('details').strip
end