Feature: Edit section in admin

	Scenario: Form for new section
		Given I am a new, authenticated user
		When I go to the new admin section page
		Then I should see input fields for edit info of section

	Scenario: Create new section
		Given I am a new, authenticated user
		When I go to the new admin section page
		And I input "New section" in title of section
		When I click save button
		Then 1 sections should exist
		And title of new section should be equaled "New section"
		And I should be at the admin section page
		And I should see success flash message

	Scenario: Form for edit section
		Given I am a new, authenticated user
		And a section exist
		When I go to the edit admin section page
		Then I should see input fields for edit info of section
		And I should see info of section in fields

	Scenario: Edit section
		Given I am a new, authenticated user
		And a section exist
		When I go to the edit admin section page
		And I input "Edit section" in title of section
		And I click save button
		Then title of section should be equaled "Edit section"
		And I should be at the admin section page
		And I should see success flash message

	Scenario: Jump to section page from editing exists section
		Given I am a new, authenticated user
		And a section exist
		When I go to the edit admin section page
		And I click back button
		Then I should be at the admin section page

	Scenario: Jump to sections page from editing new section
		Given I am a new, authenticated user
		When I go to the new admin section page
		And I click back button
		Then I should be at the admin sections page

