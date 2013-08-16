Feature: Edit category in admin

	Scenario: Form for new category
		Given I am a new, authenticated user
		And a section "Shoes" exist
		When I go to the new admin section "Shoes" category page
		Then I should see input fields for edit info of category

	Scenario: Create new category
		Given I am a new, authenticated user
		And a section "Shoes" exist
		When I go to the new admin section "Shoes" category page
		And I input "New category" in title of category
		When I click save button
		Then 1 categories should exist
		And title of new category should be equaled "New category"
		And I should be at the admin category page
		And I should see success flash message

	Scenario: Form for edit category
		Given I am a new, authenticated user
		And a category exist
		When I go to the edit admin category page
		Then I should see input fields for edit info of category
		And I should see info of category in fields

	Scenario: Edit section
		Given I am a new, authenticated user
		And a category exist
		When I go to the edit admin category page
		And I input "Edit category" in title of category
		And I click save button
		Then title of category should be equaled "Edit category"
		And I should be at the admin category page
		And I should see success flash message

	Scenario: Jump to category page from editing exists category
		Given I am a new, authenticated user
		And a category exist
		When I go to the edit admin category page
		And I click back button
		Then I should be at the admin category page

	Scenario: Jump to categories page from editing new category
		Given I am a new, authenticated user
		And a section "Shoes" exist
		When I go to the new admin section "Shoes" category page
		And I click back button
		Then I should be at the admin section "Shoes" categories page