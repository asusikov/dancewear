Feature: Edit good in admin

	Scenario: Form for new good
		Given I am a new, authenticated user
		And a category "Dance shoes" exist
		When I go to the new admin category "Dance shoes" good page
		Then I should see input fields for edit info of good

	Scenario: Create new good
		Given I am a new, authenticated user
		And a category "Dance shoes" exist
		When I go to the new admin category "Dance shoes" good page
		And I input "New good" in title of good
		And I input "Announcement body" in announcement of good
		When I click save button
		Then 1 goods should exist
		And title of new good should be equaled "New good"
		And announcement of new good should be equaled "Announcement body"
		And I should be at the admin good page
		And I should see success flash message

	Scenario: Form for edit good
		Given I am a new, authenticated user
		And a good exist
		When I go to the edit admin good page
		Then I should see input fields for edit info of good
		And I should see info of good in fields

	Scenario: Edit good
		Given I am a new, authenticated user
		And a good exists
		When I go to the edit admin good page
		And I input "Edit good" in title of good
		And I input "Edit announcement body" in announcement of good
		When I click save button
		Then title of good should be equaled "Edit good"
		And announcement of good should be equaled "Edit announcement body"
		And I should be at the admin good page
		And I should see success flash message

	Scenario: Jump to good page from editing exists good
		Given I am a new, authenticated user
		And a good exist
		When I go to the edit admin good page
		And I click back button
		Then I should be at the admin good page

	Scenario: Jump to goods page from editing new good
		Given I am a new, authenticated user
		And a category "Dance shoes" exist
		When I go to the new admin category "Dance shoes" good page
		And I click back button
		Then I should be at the admin category "Dance shoes" goods page