Feature: Sections in admin part

	Scenario Outline: Denied access for unauthorized user
		Given I am not authenticated
		And a section exists
		When I go to the <page> page
		Then I should see log in form
	Examples:
		| page               |
		| admin sections     |
		| admin section      |
		| edit admin section |

	Scenario: Show sections on section index page
		Given I am a new, authenticated user
		And 3 sections exist
		When I go to the admin sections page
		Then all sections should be shown in table

	Scenario: Jump to section page
		Given I am a new, authenticated user
		And a section exists
		When I go to the admin sections page
		And I click by section title
		Then I should be at the admin section page

	Scenario: Show info of section
		Given I am a new, authenticated user
		And a section exists
		When I go to the admin section page
		Then I should see info of section

	Scenario: Jump to new section page
		Given I am a new, authenticated user
		And 3 sections exist
		When I go to the admin sections page
		And I click by new button
		Then I should be at the new admin section page

	Scenario Outline: Jump to edit section page
		Given I am a new, authenticated user
		And a section exist
		When I go to the admin <page> page
		And I click by edit section button
		Then I should be at the edit admin section page
	Examples:
		| page     |  
		| sections |  
		| section  |  

	Scenario Outline: Destroy section
		Given I am a new, authenticated user
		And a section exist
		When I go to the admin <page> page
		And I click by destroy section button
		Then 0 sections should exist
		And I should be at the admin sections page
		And I should see success flash message
	Examples:
		| page     |  
		| sections |  
		| section  |  

	