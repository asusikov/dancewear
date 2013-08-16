Feature: Validation category

	Scenario: Validate empty title when creating
		Given I am a new, authenticated user
		And a section "Shoes" exist
		When I go to the new admin section "Shoes" category page
		And I click save button
		Then I should be at the admin section "Shoes" categories page
		And I should see error flash message
		And title of category should be with error message

	Scenario: Validate empty title when editing
		Given I am a new, authenticated user
		And a category exist
		When I go to the edit admin category page
		And I input "" in title of category
		And I click save button
		Then I should be at the admin category page
		And I should see error flash message
		And title of category should be with error message