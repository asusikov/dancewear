Feature: Edit post in admin

	Scenario: Form for new post
		Given I am a new, authenticated user
		When I go to the new admin post page
		Then I should see input fields for edit info of post

	Scenario: Create new post
		Given I am a new, authenticated user
		When I go to the new admin post page
		And I input "New post" in title of post
		And I input "Announcement body" in announcement of post
		And I input "Text body" in body of post
		When I click save button
		Then 1 posts should exist
		And title of new post should be equaled "New post"
		And announcement of new post should be equaled "Announcement body"
		And body of new post should be equaled "Text body"
		And I should be at the admin post page
		And I should see success flash message

	Scenario: Form for edit post
		Given I am a new, authenticated user
		And a post exist
		When I go to the edit admin post page
		Then I should see input fields for edit info of post
		And I should see info of post in fields

	Scenario: Edit post
		Given I am a new, authenticated user
		And a post exist
		When I go to the edit admin post page
		And I input "Edit post" in title of post
		And I input "Text body" in body of post
		And I input "Announcement body" in announcement of post
		And I click save button
		Then title of post should be equaled "Edit post"
		And body of post should be equaled "Text body"
		And announcement of new post should be equaled "Announcement body"
		And I should be at the admin post page
		And I should see success flash message

	Scenario: Jump to post page from editing exists post
		Given I am a new, authenticated user
		And a post exist
		When I go to the edit admin post page
		And I click back button
		Then I should be at the admin post page

	Scenario: Jump to posts page from editing new post
		Given I am a new, authenticated user
		When I go to the new admin post page
		And I click back button
		Then I should be at the admin posts page