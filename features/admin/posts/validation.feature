Feature: Validation post

	Scenario: Validate empty values when creating
		Given I am a new, authenticated user
		When I go to the new admin post page
		And I input "" in title of post
		And I input "" in announcement of post
		And I click save button
		Then I should be at the admin posts page
		And title of post should be with error message
		And announcement of post should be with error message
		And I should see error flash message

	Scenario: Validate empty values when editing
		Given I am a new, authenticated user
		And a post exist
		When I go to the edit admin post page
		And I input "" in title of post
		And I input "" in announcement of post
		And I click save button
		Then I should be at the admin post page
		And title of post should be with error message
		And announcement of post should be with error message
		And I should see error flash message