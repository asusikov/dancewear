Feature: Validation section

	Scenario: Validate empty title when creating
		Given I am a new, authenticated user
		When I go to the new admin section page
		And I click save button
		Then I should be at the admin sections page
		And I should see error flash message
		And title of section should be with error message

	Scenario: Validate empty title when editing
		Given I am a new, authenticated user
		And a section exist
		When I go to the edit admin section page
		And I input "" in title of section
		And I click save button
		Then I should be at the admin section page
		And I should see error flash message
		And title of section should be with error message